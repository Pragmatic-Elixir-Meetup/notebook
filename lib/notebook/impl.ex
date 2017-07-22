defmodule Notebook.Impl do

  @est_server :notebook

  def lookup_element(user_id) do
    :ets.lookup_element @est_server, user_id, 2
  catch
    _, _ -> ""
  end

  def insert(user_id, content) do
    :ets.insert @est_server, {user_id, content}
  end

  def new(), do:
    :ets.new(@est_server, [:set, :named_table, :public,
                         write_concurrency: true, read_concurrency: true])  

end