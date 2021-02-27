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
  @spec run(String.t(), %MarsExplorer.SpaceProbe{}) :: %MarsExplorer.SpaceProbe{}
  def run(command, space_probe)

  def run("L", %MarsExplorer.SpaceProbe{} = space_probe) do
    new_direction = @left_directions[space_probe.direction]
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  def run("R", %MarsExplorer.SpaceProbe{} = space_probe) do
    new_direction = @right_directions[space_probe.direction]
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  def run("M", %MarsExplorer.SpaceProbe{} = space_probe) do
    move(space_probe)
  end

  def run(_unknown_command, _space_probe), do: :unknown_command

  defp move(%MarsExplorer.SpaceProbe{x: _, y: y, direction: "N"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | y: y + 1}

  defp move(%MarsExplorer.SpaceProbe{x: _, y: y, direction: "S"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | y: y - 1}

  defp move(%MarsExplorer.SpaceProbe{x: x, y: _, direction: "E"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | x: x + 1}

  defp move(%MarsExplorer.SpaceProbe{x: x, y: _, direction: "W"} = space_probe),
    do: %MarsExplorer.SpaceProbe{space_probe | x: x - 1}
end
