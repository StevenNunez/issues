defmodule CliTest do
  use ExUnit.Case
  import Issues.CLI, only: [parse_args: 1]

  test "responds to --help and -h switch" do
    assert parse_args(["-h", "foo"]) == :help
    assert parse_args(["--help", "foo"]) == :help
  end

  test "returns 3 arguments is 3 given" do
    assert parse_args(["user", "project", "99"])  == {"user", "project", 99}
  end

  test "substitutes with default value if not given" do
    assert parse_args(["user", "project"])  == {"user", "project", 4}
  end
end
