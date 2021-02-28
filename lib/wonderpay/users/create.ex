defmodule Wonderpay.Users.Create do
  alias Wonderpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
