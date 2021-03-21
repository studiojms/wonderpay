defmodule WonderpayWeb.AccountsController do
  use WonderpayWeb, :controller

  alias Wonderpay.Account
  alias Wonderpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback WonderpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Wonderpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Wonderpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Wonderpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
