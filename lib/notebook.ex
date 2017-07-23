defmodule Notebook do

  alias Notebook.{NoteSup, Registry}
  
  # alias Notebook.{NoteSup, NoteServer}

  @type user_id :: String.t | integer
  @type content :: String.t

  # @spec save(user_id, content) :: :ok
  # def save(user_id, content) do
  #   NoteServer.save(user_id, content)
  # end

  # @spec load(user_id) :: content
  # def load(user_id) do
  #   NoteServer.load(user_id)
  # end

  @spec new(user_id) :: Supervisor.on_start_child
  def new(user_id) do
    Supervisor.start_child(NoteSup, [user_id])
  end

  @spec count() :: term
  def count do
    Supervisor.count_children(NoteSup)
  end

  def save(user_id, content) do
    Registry.service_name({Notebook.NoteServer, user_id}) 
    |> GenServer.call({:save, content})
  end

  def load(user_id) do
    Registry.service_name({Notebook.NoteServer, user_id}) 
    |> GenServer.call(:load)
  end

  # @spec service_name(term) :: Registry.key
  # def service_name(service_id) do
  #   {:via, Registry, {Notebook.Registry, service_id}}
  # end
end
