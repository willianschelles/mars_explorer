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

  @left_directions %{
    "N" => "W",
    "W" => "S",
    "S" => "E",
    "E" => "N"
  }

  @spec run(String.t(), %MarsExplorer.SpaceProbe{}) :: %MarsExplorer.SpaceProbe{}
  def run(command, space_probe)

  def run("L", %MarsExplorer.SpaceProbe{} = space_probe) do
    new_direction = turn_to_left(space_probe.direction)
    %MarsExplorer.SpaceProbe{space_probe | direction: new_direction}
  end

  defp turn_to_left(direction), do: @left_directions[direction]
end
