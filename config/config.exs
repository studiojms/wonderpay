# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wonderpay,
  ecto_repos: [Wonderpay.Repo]

# Configures the endpoint
config :wonderpay, WonderpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "koW7PvBJ0Bj3NhI5x7gS3zX4QjfKMJd29f12oXwWw3BT8/Aq28SfHSE2dPwYX+3a",
  render_errors: [view: WonderpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wonderpay.PubSub,
  live_view: [signing_salt: "JqIyXSbs"]

config :wonderpay, Wonderpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :wonderpay, :basic_auth,
  username: "test",
  password: "123456"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
