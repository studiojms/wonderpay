defmodule WonderpayWeb.FallbackController do
  use WonderpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(WonderpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
