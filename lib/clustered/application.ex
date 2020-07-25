defmodule Clustered.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Clustered.Router, port: 4000)
    ]

    opts = [strategy: :one_for_one, name: Tardigrade.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
