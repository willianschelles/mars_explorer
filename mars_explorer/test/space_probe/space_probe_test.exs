defmodule MarsExplorer.SpaceProbeTest do
  use ExUnit.Case
  # doctest MarsExplorer

  alias MarsExplorer.SpaceProbe

  test "builds a struct %SpaceProbe{}" do
    expected = %SpaceProbe{
      x: nil,
      y: nil,
      direction: nil
    }

    assert %SpaceProbe{} == expected
  end

  test "turns to West when direction is North and command is L" do
    space_probe = %SpaceProbe{x: 0, y: 0, direction: "N"}
    command = "L"
    expected_direction = "W"

    assert %SpaceProbe{x: 0, y: 0, direction: ^expected_direction} =
             SpaceProbe.run(command, space_probe)
  end
end
