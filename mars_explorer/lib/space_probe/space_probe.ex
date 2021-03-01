defmodule MarsExplorer.SpaceProbe.Command do
  @moduledoc """
  Struct that defines the known commands.
  """

  defstruct command: "L" || "R" || "M"
end

defmodule MarsExplorer.SpaceProbe do
  @moduledoc """
  Struct that represents a space probe.
  """
  @type t :: %__MODULE__{
          x: integer(),
          y: integer(),
          direction: String.t()
        }
  defstruct [:x, :y, :direction]

  @left_directions %{
    "N" => "W",
    "W" => "S",
    "S" => "E",
    "E" => "N"
  }

  @right_directions %{
    "N" => "E",
    "E" => "S",
    "S" => "W",
    "W" => "N"
  }
  @spec run(%MarsExplorer.SpaceProbe.Command{}, %MarsExplorer.SpaceProbe{}, integer()) ::
          %MarsExplorer.SpaceProbe{}
  def run(command, space_probe, mesh_size)

  def run("L", %MarsExplorer.SpaceProbe{} = space_probe, _mesh_size) do
    new_direction = @left_directions[space_probe.direction]
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  def run("R", %MarsExplorer.SpaceProbe{} = space_probe, _mesh_size) do
    new_direction = @right_directions[space_probe.direction]
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  def run("M", %MarsExplorer.SpaceProbe{} = space_probe, mesh_size) do
    if can_move?(space_probe, mesh_size),
      do: move(space_probe),
      else: raise("Cannot be moved. Out of bound")
  end

  def run(_unknown_command, _space_probe, _mesh_size), do: :unknown_command

  defp can_move?(space_probe, mesh_size) do
    space_probe.x >= 0 and space_probe.x < mesh_size and space_probe.y >= 0 and
      space_probe.y < mesh_size
  end

  defp move(%MarsExplorer.SpaceProbe{x: _, y: y, direction: "N"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | y: y + 1}

  defp move(%MarsExplorer.SpaceProbe{x: _, y: y, direction: "S"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | y: y - 1}

  defp move(%MarsExplorer.SpaceProbe{x: x, y: _, direction: "E"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | x: x + 1}

  defp move(%MarsExplorer.SpaceProbe{x: x, y: _, direction: "W"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | x: x - 1}
end
