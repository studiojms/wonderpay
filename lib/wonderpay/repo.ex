defmodule Wonderpay.Repo do
  use Ecto.Repo,
    otp_app: :wonderpay,
    adapter: Ecto.Adapters.Postgres
end
