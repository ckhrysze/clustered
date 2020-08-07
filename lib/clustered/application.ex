defmodule Clustered.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Cluster.Supervisor,
       [Application.get_env(:libcluster, :topologies), [name: VS.ClusterSupervisor]]},
      Plug.Cowboy.child_spec(scheme: :http, plug: Clustered.Router, port: Clustered.Router.port())
    ]

    opts = [strategy: :one_for_one, name: Tardigrade.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
