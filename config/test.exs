use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :itsavesplanet_org, ITSPWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :itsavesplanet_org, ITSP.Repo,
       adapter: Ecto.Adapters.Postgres,
       database: "itsavesplanet_org_test",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox
