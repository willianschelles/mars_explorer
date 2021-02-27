defmodule MarsExplorer.SpaceProbe do
  @moduledoc """
  Struct that represents a space probe.
  """
  @type t :: %__MODULE__{
          x: integer(),
          y: integer(),
          direction: string()
        }
  defstruct [:x, :y, :direction]

  @spec run(String.t(), %MarsExplorer.SpaceProbe{}) :: %MarsExplorer.SpaceProbe{}
  def run(command, space_probe)

  def run("L", %MarsExplorer.SpaceProbe{} = space_probe) do
    new_direction = turn_to_left(space_probe.direction)
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  def run("R", %MarsExplorer.SpaceProbe{} = space_probe) do
    new_direction = turn_to_right(space_probe.direction)
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  @left_directions %{
    "N" => "W",
    "W" => "S",
    "S" => "E",
    "E" => "N"
  }
  defp turn_to_left(direction), do: @left_directions[direction]

  @right_directions %{
    "N" => "E",
    "E" => "S",
    "S" => "W",
    "W" => "N"
  }
  defp turn_to_right(direction), do: @right_directions[direction]
end
