defmodule Clustered.Router do
  use Plug.Router

  require Logger

  def port, do: Application.get_env(:clustered, :port)

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Success!")
  end

  get "/port" do
    send_resp(conn, 200, "Running on: #{port()}")
  end

  match _ do
    send_resp(conn, 404, "Nothing to see here...")
  end
end
