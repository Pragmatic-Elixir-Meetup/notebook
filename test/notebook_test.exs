defmodule NotebookTest do
  use ExUnit.Case
  doctest Notebook

  test "save and load notebook" do
    Notebook.new "Bill"
    Notebook.save "Bill", "hello"
    assert {:ok, "hello"} == Notebook.load "Bill"
  end
end
