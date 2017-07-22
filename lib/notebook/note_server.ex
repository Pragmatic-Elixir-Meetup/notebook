defmodule Notebook.NoteServer do
  use GenServer

  alias Notebook.{Impl, Registry}

  # Apis

  # def save(user_id, content) do
  #   GenServer.call(service_name(user_id), {:save, content})
  # end

  # def load(user_id) do
  #   GenServer.call(service_name(user_id), :load)
  # end


  # Callbacks

  def start_link(_, user_id) do
    GenServer.start_link(
      __MODULE__,
      user_id,
      name: service_name(user_id)
    )
  end

  def init(user_id) do
    {:ok, user_id}
  end

  def handle_call({:save, content}, _from, user_id) when is_binary(content) do
    Impl.insert(user_id, content)

    { :reply, :ok, user_id }
  end

  def handle_call(:load, _from, user_id) do
    response = Impl.lookup_element(user_id)
    { :reply, {:ok, response}, user_id }
  end

  defp service_name(user_id), do:
    Registery.service_name({__MODULE__, user_id})

  # defp load_from_ets(user_id) do
  #   :ets.lookup_element :notebook, user_id, 2
  # catch
  #   _, _ -> ""
  # end

  # defp save_to_ets(user_id, content) do
  #   :ets.insert :notebook, {user_id, content}
  # end
end