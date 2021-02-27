defmodule MarsExplorer.SpaceProbeTest do
  use ExUnit.Case
  # doctest MarsExplorer

  alias MarsExplorer.SpaceProbe

  describe "default attributes" do
    test "builds a struct %SpaceProbe{}" do
      expected = %SpaceProbe{
        x: nil,
        y: nil,
        direction: nil
      }

      assert %SpaceProbe{} == expected
    end
  end

  describe "run/2" do
    test "returns unknown_command when command isn't L, R or M" do
      space_probe = %SpaceProbe{}
      assert :unknown_command = SpaceProbe.run("Move", space_probe)
    end

    ## Left command tests
    test "turns to West when direction is North and command is L" do
      initial_direction = "N"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "W"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to South when direction is West and command is L" do
      initial_direction = "W"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "S"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to East when direction is South and command is L" do
      initial_direction = "S"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "E"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to North when direction is East and command is L" do
      initial_direction = "E"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "L"
      expected_direction = "N"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    ## Right command tests
    test "turns to East when direction is North and command is R" do
      initial_direction = "N"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "E"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to South when direction is East and command is R" do
      initial_direction = "E"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "S"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to West when direction is South and command is R" do
      initial_direction = "S"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "W"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    test "turns to North when direction is West and command is R" do
      initial_direction = "W"
      space_probe = %SpaceProbe{x: 0, y: 0, direction: initial_direction}
      command = "R"
      expected_direction = "N"

      assert %SpaceProbe{x: _, y: _, direction: ^expected_direction} =
               SpaceProbe.run(command, space_probe)
    end

    ## Move command tests
    test "moves to y+1 position when direction is North" do
      space_probe = %SpaceProbe{x: 0, y: 0, direction: "N"}
      command = "M"

      expected_y_coordinate = 1

      assert %SpaceProbe{x: _, y: ^expected_y_coordinate, direction: "N"} =
               SpaceProbe.run(command, space_probe)
    end

    test "moves to y-1 position when direction is South" do
      space_probe = %SpaceProbe{x: 0, y: 1, direction: "S"}
      command = "M"
      expected_y_coordinate = 0

      assert %SpaceProbe{x: _, y: ^expected_y_coordinate, direction: "S"} =
               SpaceProbe.run(command, space_probe)
    end

    test "moves to x+1 position when direction is East" do
      space_probe = %SpaceProbe{x: 0, y: 0, direction: "E"}
      command = "M"
      expected_x_coordinate = 1

      assert %SpaceProbe{x: ^expected_x_coordinate, y: _, direction: "E"} =
               SpaceProbe.run(command, space_probe)
    end

    test "moves to x-1 position when direction is West" do
      space_probe = %SpaceProbe{x: 1, y: 0, direction: "W"}
      command = "M"
      expected_x_coordinate = 0

      assert %SpaceProbe{x: ^expected_x_coordinate, y: _, direction: "W"} =
               SpaceProbe.run(command, space_probe)
    end
  end
end
