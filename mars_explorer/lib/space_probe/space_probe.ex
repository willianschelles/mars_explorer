defmodule MarsExplorer.MarsRover.Command do
  @moduledoc """
  Struct that defines the known commands.
  """

  defstruct command: "L" || "R" || "M"
end

defmodule MarsExplorer.MarsRover do
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
  @spec run(%MarsExplorer.MarsRover.Command{}, %MarsExplorer.MarsRover{}, integer()) ::
          %MarsExplorer.MarsRover{}
  def run(command, mars_rover, mesh_size)

  def run("L", %MarsExplorer.MarsRover{} = mars_rover, _mesh_size) do
    new_direction = @left_directions[mars_rover.direction]
    %MarsExplorer.MarsRover{mars_rover | direction: new_direction}
  end

  def run("R", %MarsExplorer.MarsRover{} = mars_rover, _mesh_size) do
    new_direction = @right_directions[mars_rover.direction]
    %MarsExplorer.MarsRover{mars_rover | direction: new_direction}
  end

  def run("M", %MarsExplorer.MarsRover{} = mars_rover, mesh_size) do
    if can_move?(mars_rover, mesh_size),
      do: move(mars_rover),
      else: raise("Cannot be moved. Out of bound")
  end

  def run(_unknown_command, _mars_rover, _mesh_size), do: :unknown_command

  defp can_move?(mars_rover, mesh_size) do
    mars_rover.x >= 0 and mars_rover.x <= mesh_size and mars_rover.y >= 0 and
      mars_rover.y <= mesh_size
  end

  defp move(%MarsExplorer.MarsRover{x: _, y: y, direction: "N"} = mars_rover),
    do: %MarsExplorer.MarsRover{mars_rover | y: y + 1}

  defp move(%MarsExplorer.MarsRover{x: _, y: y, direction: "S"} = mars_rover),
    do: %MarsExplorer.MarsRover{mars_rover | y: y - 1}

  defp move(%MarsExplorer.MarsRover{x: x, y: _, direction: "E"} = mars_rover),
    do: %MarsExplorer.MarsRover{mars_rover | x: x + 1}

  defp move(%MarsExplorer.MarsRover{x: x, y: _, direction: "W"} = mars_rover),
    do: %MarsExplorer.MarsRover{mars_rover | x: x - 1}
end
