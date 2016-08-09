# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wholesail,
  ecto_repos: [Wholesail.Repo]

# Configures the endpoint
config :wholesail, Wholesail.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lABpoMl2LJnRG+ugcuJqYJ+vj+NBB9tlL29C3as1x4WrPE75tNcehuAGepj8xHwE",
  render_errors: [view: Wholesail.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wholesail.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
