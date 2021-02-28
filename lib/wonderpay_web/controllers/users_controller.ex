defmodule WonderpayWeb.UsersController do
  use WonderpayWeb, :controller

  alias Wonderpay.User

  action_fallback WonderpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Wonderpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
