defmodule Clustered.Router do
  use Plug.Router

  require Logger

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Success!")
  end

  match _ do
    send_resp(conn, 404, "Nothing to see here...")
  end
end
