defmodule MarsExplorer do
  @moduledoc """
  Documentation for `MarsExplorer`.
  """

  alias MarsExplorer.MarsRover

  @doc """
  Explores Mars plateau given a mesh size, initial position and sequence of commands.

  ## Examples

      iex> MarsExplorer.explore(5, {1, 2, "N"}, %MarsRover{})
      %MarsRover{}

  """
  @spec explore(integer(), tuple(), String.t()) :: MarsRover.t()
  def explore(mesh_size, initial_position, commands) do
    {x, y, direction} = initial_position
    initial_mars_rover = %MarsRover{x: x, y: y, direction: direction}

    commands = String.graphemes(commands)

    Enum.reduce(commands, initial_mars_rover, fn command, mars_rover ->
      mars_rover = MarsRover.run(command, mars_rover, mesh_size)
    end)
  end
end
