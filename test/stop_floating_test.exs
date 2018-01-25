defmodule StopFloatingTest do
  use ExUnit.Case
  doctest StopFloating

  describe "parse/1" do
    test "tells us all the lines on which we're using floats for a given file" do
      file = """
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
      """

      assert StopFloating.parse(file) == [7, 10, 13]
    end
  end
end
