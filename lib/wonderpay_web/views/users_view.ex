defmodule WonderpayWeb.UsersView do
  alias Wonderpay.{User, Account}

  def render("create.json", %{
        user: %User{
          id: id,
          account: %Account{id: account_id, balance: balance},
          name: name,
          nickname: nickname
        }
      }) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
