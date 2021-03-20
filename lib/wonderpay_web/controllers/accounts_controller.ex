defmodule WonderpayWeb.AccountsController do
  use WonderpayWeb, :controller

  alias Wonderpay.Account

  action_fallback WonderpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Wonderpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
