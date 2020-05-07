defmodule PreloadBug.Invoice do
  use Ecto.Schema

  schema "invoices" do
    field :number, :string

    timestamps()

    has_many :pages, PreloadBug.Page
    has_many :attachments, through: [:pages, :attachment]
  end
end
