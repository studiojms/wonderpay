defmodule WonderpayWeb.UsersViewTest do
  use WonderpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Wonderpay.{User, Account}
  alias WonderpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "John Doe",
      password: "123456",
      nickname: "john_doe",
      email: "johndoe@johndoe.com",
      age: 30
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Wonderpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User Created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "John Doe",
        nickname: "john_doe"
      }
    }

    assert expected_response == response
  end
end
