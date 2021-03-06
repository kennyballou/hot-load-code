defmodule KV do
  use GenServer

  @version 0

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, %{}}
  end

  def get(pid \\ __MODULE__, key, default \\ nil)
  def get(pid, key, default) do
    GenServer.call(pid, {:get, key, default})
  end

  def put(pid \\ __MODULE__, key, value)
  def put(pid, key, value) do
    GenServer.call(pid, {:put, key, value})
  end

  def handle_call({:get, key, default}, _caller, state) do
    {:reply, Map.get(state, key, default), state}
  end

  def handle_call({:put, key, value}, _caller, state) do
    {:reply, :ok, Map.put(state, key, value)}
  end

end
