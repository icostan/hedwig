defmodule Hedwig do
  @moduledoc """
  Hedwig Application

  ## Starting a robot

      {:ok, pid} = Hedwig.start_robot(MyApp.Robot, name: "alfred")

  ## Stopping a robot

      Hedwig.stop_client(pid)
  """

  use Application

  @doc false
  def start(_type, _args) do
    Hedwig.Supervisor.start_link()
  end

  @doc """
  Starts a robot with the given configuration.
  """
  defdelegate start_robot(robot, opts \\ []), to: Hedwig.Robot.Supervisor

  @doc """
  Stops a robot with the given PID.
  """
  defdelegate stop_robot(pid), to: Hedwig.Robot.Supervisor

  @doc """
  List all robots.
  """
  defdelegate which_robots, to: Hedwig.Robot.Supervisor
end
