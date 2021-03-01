defmodule MarsExplorerTest do
  use ExUnit.Case
  # doctest MarsExplorer

  alias MarsExplorer.SpaceProbe

  describe "explore/3" do
    test "returns a tuple containing position and direction" do
      mesh_size = 5
      initial_position = {1, 2, "N"}
      commands = "LMLMLMLMM"

      assert %SpaceProbe{x: 1, y: 3, direction: "N"} =
               MarsExplorer.explore(mesh_size, initial_position, commands)
    end

    test "returns a tuple containing position and direction given another initialization" do
      mesh_size = 5
      initial_position = {3, 3, "E"}
      commands = "MMRMMRMRRM"
      # commands = "MMRMMRMRRM"

      assert %SpaceProbe{x: 5, y: 1, direction: "E"} =
               MarsExplorer.explore(mesh_size, initial_position, commands)
    end

    test "raises error when commands sends Mars Rover out of mesh boundary" do
      mesh_size = 5
      initial_position = {3, 3, "E"}
      commands = "MMRMMRMRRMM"

      assert_raise RuntimeError, ~r/Cannot be moved. Out of bound/, fn ->
        MarsExplorer.explore(mesh_size, initial_position, commands)
      end
    end
  end
end
