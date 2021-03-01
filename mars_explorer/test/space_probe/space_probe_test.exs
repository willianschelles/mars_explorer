defmodule MarsExplorer.MarsRoverTest do
  use ExUnit.Case
  # doctest MarsExplorer

  alias MarsExplorer.MarsRover

  describe "default attributes" do
    test "builds a struct %MarsRover{}" do
      expected = %MarsRover{
        x: nil,
        y: nil,
        direction: nil
      }

      assert %MarsRover{} == expected
    end
  end

  describe "run/2" do
    test "returns unknown_command when command isn't L, R or M" do
      mars_rover = %MarsRover{}
      assert :unknown_command = MarsRover.run("Move", mars_rover, 5)
    end

    ## Left command tests
    test "turns to West when direction is North and command is L" do
      initial_direction = "N"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "W"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to South when direction is West and command is L" do
      initial_direction = "W"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "S"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to East when direction is South and command is L" do
      initial_direction = "S"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "E"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to North when direction is East and command is L" do
      initial_direction = "E"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "N"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    ## Right command tests
    test "turns to East when direction is North and command is R" do
      initial_direction = "N"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "E"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to South when direction is East and command is R" do
      initial_direction = "E"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "S"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to West when direction is South and command is R" do
      initial_direction = "S"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "W"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "turns to North when direction is West and command is R" do
      initial_direction = "W"
      mars_rover = %MarsRover{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "N"

      assert %MarsRover{x: _, y: _, direction: ^expected_direction} =
               MarsRover.run(command, mars_rover, 5)
    end

    ## Move command tests
    test "moves to y+1 position when direction is North" do
      mars_rover = %MarsRover{x: 0, y: 0, direction: "N"}
      command = "M"

      expected_y_coordinate = 1

      assert %MarsRover{x: _, y: ^expected_y_coordinate, direction: "N"} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "moves to y-1 position when direction is South" do
      mars_rover = %MarsRover{x: 0, y: 1, direction: "S"}
      command = "M"
      expected_y_coordinate = 0

      assert %MarsRover{x: _, y: ^expected_y_coordinate, direction: "S"} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "moves to x+1 position when direction is East" do
      mars_rover = %MarsRover{x: 0, y: 0, direction: "E"}
      command = "M"
      expected_x_coordinate = 1

      assert %MarsRover{x: ^expected_x_coordinate, y: _, direction: "E"} =
               MarsRover.run(command, mars_rover, 5)
    end

    test "moves to x-1 position when direction is West" do
      mars_rover = %MarsRover{x: 1, y: 0, direction: "W"}
      command = "M"
      expected_x_coordinate = 0

      assert %MarsRover{x: ^expected_x_coordinate, y: _, direction: "W"} =
               MarsRover.run(command, mars_rover, 5)
    end
  end
end
