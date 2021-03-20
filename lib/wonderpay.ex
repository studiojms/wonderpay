defmodule Wonderpay do
  alias Wonderpay.Users.Create, as: UserCreate
  alias Wonderpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
