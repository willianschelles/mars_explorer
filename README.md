# MarsExplorer

This project is about exploring Mars by controlling a probe that moves over an NxN mesh.

To run MarsExplorar program, we can:

  1 - Enter in iex (Elixir's interactive shell) by typing on Terminal: `iex` an then run:

    iex> MarsExplorer.initialize_mars_rover("instructions.txt")

    where, "instructions.txt" is a set of instructions telling how Mars Rover should explores Mars plateau.


  2 - Executing a test suite from ExUnit, calling `mix test` from the root of project.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mars_explorer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mars_explorer, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mars_explorer](https://hexdocs.pm/mars_explorer).

