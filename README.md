# StopFloating

Have you ever noticed that using floating point numbers always ends up with
someone tearing their hair out because of weird issues with accuracy and
inconsistent rounding? That's unfortunately just life with floats.

StopFloating shows you where exactly you're using floating point literals in
your Elixir applications so you can go through and use something better instead,
like the wonderful Decimal library.

## Usage

First, clone this library on your computer. Open up `run.exs` and put in
any list of file paths (relative or absolute) to analyze. Run the analysis with
`mix run run.exs`, and you'll see exactly where you're using floats so you can
replace them!

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stop_floating` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stop_floating, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/stop_floating](https://hexdocs.pm/stop_floating).

