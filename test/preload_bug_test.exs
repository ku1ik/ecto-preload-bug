defmodule PreloadBugTest do
  use ExUnit.Case
  doctest PreloadBug

  test "greets the world" do
    assert PreloadBug.hello() == :world
  end
end
