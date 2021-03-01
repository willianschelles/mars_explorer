defmodule MarsExplorer do
  @moduledoc """
  Contains functions for reading instructions from a file,
  exploring Mars according to those instructions, and writing
  the output to a txt file in the specified format.
  """

  alias MarsExplorer.MarsRover

  @doc """
  Initialize Mars Rover according to the input instructions,
  and tell to mars rover explores the plateu and write the output in file.
  ## Examples

      iex> MarsExplorer.initialize_mars_rover("instructions.txt")
      :ok

  """
  @spec initialize_mars_rover(String.t()) :: map()
  def initialize_mars_rover(instructions_txt) do
    {mesh_size, {positions, commands}} = parse_input(instructions_txt)

    mars_rover_final_positions =
      positions
      |> Enum.with_index()
      |> Enum.map(fn {position, index} ->
        [x, y, direction] = String.graphemes(position)
        initial_position = {String.to_integer(x), String.to_integer(y), direction}
        command = Enum.at(commands, index)

        explore(mesh_size, initial_position, command)
      end)

    write_final_positions("final_positions.txt", mars_rover_final_positions)
  end

  @doc """
  Explores Mars plateau given a mesh size,
  initial position and sequence of commands.

  ## Examples

      iex> MarsExplorer.explore(5, {1, 2, "N"}, %MarsRover{})
      %MarsRover{}

  """
  @spec explore(integer(), tuple(), String.t()) :: MarsRover.t()
  def explore(mesh_size, initial_position, commands) do
    {x, y, direction} = initial_position
    initial_mars_rover = %MarsRover{x: x, y: y, direction: direction}

    commands = String.graphemes(commands)

    Enum.reduce(commands, initial_mars_rover, fn command, mars_rover ->
      MarsRover.run(command, mars_rover, mesh_size)
    end)
  end

  defp parse_input(instructions_file_txt) do
    contents =
      instructions_file_txt
      |> File.read!()
      |> String.split(" ")
      |> List.to_string()
      |> String.split("\n", trim: true)

    {mesh_size, contents} = List.pop_at(contents, 0)
    mesh_size = String.slice(mesh_size, 0..0) |> String.to_integer()

    {mesh_size, Enum.split_with(contents, fn content -> String.length(content) == 3 end)}
  end

  defp write_final_positions(output_file_txt, mars_rover_final_positions) do
    final_positions =
      Enum.map(mars_rover_final_positions, fn final_position ->
        "#{final_position.x} #{final_position.y} #{final_position.direction}\n"
      end)

    File.write!(output_file_txt, final_positions)
  end
end
