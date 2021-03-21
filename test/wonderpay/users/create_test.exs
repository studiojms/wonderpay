defmodule Wonderpay.Users.CreateTest do
  use Wonderpay.DataCase, async: true

  alias Wonderpay.User
  alias Wonderpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "John Doe",
        password: "123456",
        nickname: "john_doe",
        email: "johndoe@johndoe.com",
        age: 30
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "John Doe", age: 30, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "John Doe",
        nickname: "john",
        email: "johndoe@johndoe.com",
        age: 12
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert expected_response == errors_on(changeset)
    end
  end
end
