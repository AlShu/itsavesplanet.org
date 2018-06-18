# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :itsavesplanet_org,
       namespace: ITSP

# Configures the endpoint
config :itsavesplanet_org,
       ITSPWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "FnH7A+Jvp164oG2/UxWjmgDXlnG1LSj44oImEVosMA7vgRntRbbCXE8ExBgEfHvq",
       render_errors: [
         view: ITSPWeb.ErrorView,
         accepts: ~w(html json)
       ],
       pubsub: [
         name: ITSP.PubSub,
         adapter: Phoenix.PubSub.PG2
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix,
       :template_engines,
       slim: PhoenixSlime.Engine,
       slime: PhoenixSlime.Engine

config :itsavesplanet_org,
       ITSP.Repo,
       adapter: Ecto.Adapters.Postgres,
       database: "itsavesplanet.org",
       username: "postgres",
       password: "postgres",
       port: "5434"

config :itsavesplanet_org, ecto_repos: [ITSP.Repo]