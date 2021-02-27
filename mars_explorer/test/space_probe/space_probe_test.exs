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
  end
end
