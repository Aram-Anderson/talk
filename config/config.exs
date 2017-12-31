# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :talk,
  ecto_repos: [Talk.Repo]

# Configures the endpoint
config :talk, Talk.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "70lz03zzHyGfrhpjZ/YNPlS2Eh0dY4H9x3oQbcqavhqWbDlrttzP2p8S9hPuHFzD",
  render_errors: [view: Talk.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Talk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
