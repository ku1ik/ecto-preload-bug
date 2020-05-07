import Config

config :preload_bug, ecto_repos: [PreloadBug.Repo]

config :preload_bug, PreloadBug.Repo,
  database: "preload_bug",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
