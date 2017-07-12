defmodule NotebookTest do
  use ExUnit.Case
  doctest Notebook

  test "greets the world" do
    assert Notebook.hello() == :world
  end
end
