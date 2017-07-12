defmodule Notebook do

  alias Notebook.{NoteSup, NoteServer}

  def save(user_id, content) do
    NoteServer.save(user_id, content)
  end

  def load(user_id) do
    NoteServer.load(user_id)
  end

  def new(user_id) do
    Supervisor.start_child(NoteSup, [user_id])
  end

  def count do
    Supervisor.count_children(NoteSup)
  end

  def service_name(service_id) do
    {:via, Registry, {Notebook.Registry, service_id}}
  end
end
