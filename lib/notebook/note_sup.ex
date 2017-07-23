defmodule Notebook.NoteSup do
  use Supervisor
  alias Notebook.{Server, Impl}

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    r =
      Supervisor.init([
        Server
      ], strategy: :simple_one_for_one)
    Impl.new()
    r
  end

  # defp create_ets, do:
  #   :ets.new(:notebook, [:set, :named_table, :public,
  #                        write_concurrency: true, read_concurrency: true])
end