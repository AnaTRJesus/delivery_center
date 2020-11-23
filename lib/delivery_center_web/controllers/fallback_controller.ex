defmodule DeliveryCenterWeb.FallbackController do
  use DeliveryCenterWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(DeliveryCenterWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
