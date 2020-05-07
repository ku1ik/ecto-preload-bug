defmodule PreloadBug.Repo.Migrations.AddSchemas do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :number, :string
      timestamps()
    end

    create table(:attachments) do
      add :filename, :string
      timestamps()
    end

    create table(:pages) do
      add :number, :integer
      add :invoice_id, references(:invoices)
      add :attachment_id, references(:attachments)
      timestamps()
    end
  end
end
