defmodule StopFloating do
  @moduledoc """
  Main entrypoint for the parsing and analysis functions of this tool.
  """

  def analyze(file_paths) do
    Enum.each(file_paths, fn file_path ->
      {:ok, file} = File.read(file_path)
      line_numbers = parse(file)
      IO.puts """
      Looks like you have some floats in "#{file_path}" on lines #{Enum.join(line_numbers, ", ")}!
      You should probably replace those...
      """
    end)
  end

  @doc """
  Parses the already read file and finds the lines on which any float literal is
  used.
  """
  @spec parse(binary) :: [non_neg_integer]
  def parse(file) do
    {:ok, ast} = Code.string_to_quoted(file)
    {_, {line_numbers, _}} = Macro.postwalk(ast, {[], 0}, fn
      node = {_, [line: line_number], _}, {acc, max_line_number} ->
        if line_number < max_line_number do
          {node, {acc, max_line_number}}
        else
          if operation_contains_float?(node) do
            {node, {[line_number | acc], line_number}}
          else
            {node, {acc, line_number}}
          end
        end
      node, acc ->
        {node, acc}
    end)
    line_numbers
    |> Enum.uniq
    |> Enum.reverse
  end

  defp operation_contains_float?({_, _, nil}), do: false

  defp operation_contains_float?({_, _, ast}) do
    Enum.any?(ast, fn node ->
      {_, true_or_false} = Macro.postwalk(node, false, fn
        sub_node, _ when is_float(sub_node) ->
          {sub_node, true}
        sub_node, true_or_false ->
          {sub_node, true_or_false}
      end)

      true_or_false
    end)
  end
end
