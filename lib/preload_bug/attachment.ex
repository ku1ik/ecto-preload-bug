defmodule PreloadBug.Attachment do
  use Ecto.Schema

  schema "attachments" do
    field :filename, :string

    timestamps()

    has_many :pages, PreloadBug.Page
    has_many :invoices, through: [:pages, :invoice]
  end
end
