defmodule Wonderpay do
  alias Wonderpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
