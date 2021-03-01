defmodule MarsExplorer do
  @moduledoc """
  Documentation for `MarsExplorer`.
  """

  alias MarsExplorer.SpaceProbe

  @doc """
  Explores Mars plateau given a mesh size, initial position and sequence of commands.

  ## Examples

      iex> MarsExplorer.explore(5, {1, 2, "N"}, %SpaceProbe{})
      %SpaceProbe{}

  """
  @spec explore(integer(), tuple(), String.t()) :: SpaceProbe.t()
  def explore(mesh_size, initial_position, commands) do
    {x, y, direction} = initial_position
    initial_space_probe = %SpaceProbe{x: x, y: y, direction: direction}

    commands = String.graphemes(commands)

    Enum.reduce(commands, initial_space_probe, fn command, space_probe ->
      space_probe = SpaceProbe.run(command, space_probe, mesh_size)
    end)
  end
end
