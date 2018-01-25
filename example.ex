defmodule Tester do
  def int_add_1(num) do
    num + 1
  end

  def float_add_1(num) do
    num + 1.0
  end

  defp float_multiply_2(num), do: num * 2.0

  def call_other_fun do
    float_add_1(2.0)
  end
end
