# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :covid19,
  ecto_repos: [Covid19.Repo]

# Configures the endpoint
config :covid19, Covid19Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KpJ7zCpnH/U1m8ekdMn7aLg8omzZWZ4NBOs0VRvaxEWCReVkO3e8u0tfqDctA0/2",
  render_errors: [view: Covid19Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Covid19.PubSub,
  live_view: [signing_salt: "qyqFc9fQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
