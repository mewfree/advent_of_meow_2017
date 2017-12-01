defmodule AOMTest do
  use ExUnit.Case
  doctest AOM

  test "greets the world" do
    assert AOM.hello() == :world
  end
end
