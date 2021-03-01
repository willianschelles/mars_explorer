defmodule MarsExplorerTest do
  use ExUnit.Case
  # doctest MarsExplorer

  alias MarsExplorer.MarsRover

  describe "explore/3" do
    test "returns a tuple containing position and direction" do
      mesh_size = 5
      initial_position = {1, 2, "N"}
      commands = "LMLMLMLMM"

      assert %MarsRover{x: 1, y: 3, direction: "N"} =
               MarsExplorer.explore(mesh_size, initial_position, commands)
    end

    test "returns a tuple containing position and direction given another initialization" do
      mesh_size = 5
      initial_position = {3, 3, "E"}
      commands = "MMRMMRMRRM"

      assert %MarsRover{x: 5, y: 1, direction: "E"} =
               MarsExplorer.explore(mesh_size, initial_position, commands)
    end

    test "raises error when commands sends Mars Rover out of mesh boundary" do
      mesh_size = 5
      initial_position = {3, 3, "E"}
      commands = "MMRMMRMRRMMMMM"

      assert_raise RuntimeError, ~r/Cannot be moved. Out of bound/, fn ->
        MarsExplorer.explore(mesh_size, initial_position, commands)
      end
    end
  end

  describe "initialize_mars_rover/1" do
    test "parses input given file, explores Mars and write Mars Rover final positions in File" do

      final_positions_txt = "final_positions.txt"
      File.rm(final_positions_txt)

      assert {:error, _no_file} = File.read(final_positions_txt)
      assert :ok == MarsExplorer.initialize_mars_rover("instructions.txt")
      assert "1 3 N\n5 1 E\n" == File.read!(final_positions_txt)
    end
  end
end
