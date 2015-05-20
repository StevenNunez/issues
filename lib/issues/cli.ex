defmodule Issues.CLI do
  @default_count 4
  @moduledoc """
  Handle the command line parsing and the
  dispatch to the various functions that end
  up generating a table of the last _n_ issues
  in a github project
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """

  def parse_args(argv) do
     OptionParser.parse(argv,
                  switches: [help: :boolean],
                  aliases:  [h: :help]) |>
    _parse_args
  end

  defp _parse_args({ [ help: true ], _, _ }), do: :help

  defp _parse_args({ _, [ user, project, count ], _ }) do
    { user, project, count |> String.to_integer }
  end

  defp _parse_args({ _, [ user, project ], _ }) do
    { user, project, @default_count }
  end

  defp _parse_args(_), do: :help
end
