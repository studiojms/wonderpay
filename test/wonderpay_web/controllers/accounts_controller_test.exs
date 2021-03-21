defmodule WonderpayWeb.AccountsControllerTest do
  use WonderpayWeb.ConnCase, async: true

  alias Wonderpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "John Doe",
        password: "123456",
        nickname: "john_doe",
        email: "johndoe@johndoe.com",
        age: 30
      }

      {:ok, %User{account: %Account{id: account_id}}} = Wonderpay.create_user(params)

      # encoded user:password in base64 with Base.encode64("test:123456")
      conn = put_req_header(conn, "authorization", "Basic dGVzdDoxMjM0NTY=")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Balance updated successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "x"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid operation value"}

      assert expected_response == response
    end
  end
end
