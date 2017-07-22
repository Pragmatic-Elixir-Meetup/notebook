defmodule Notebook.Registry do

  @spec service_name(term) :: Registry.key
  def service_name(service_id) do
    {:via, Registry, {__MODULE__, service_id}}
  end

end