defmodule PreloadBug.Repo do
  use Ecto.Repo,
    otp_app: :preload_bug,
    adapter: Ecto.Adapters.Postgres
end
