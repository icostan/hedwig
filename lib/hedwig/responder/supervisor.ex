defmodule Hedwig.Responder.Supervisor do
  @moduledoc false

  def start_link do
    DynamicSupervisor.start_link(strategy: :one_for_one)
  end

  def start_child(sup, opts) do
    DynamicSupervisor.start_child(sup, {Hedwig.Responder, opts})
  end
end
