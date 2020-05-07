defmodule PreloadBug.Page do
  use Ecto.Schema

  schema "pages" do
    field :number, :integer

    timestamps()

    belongs_to :invoice, PreloadBug.Invoice
    belongs_to :attachment, PreloadBug.Attachment
  end
end
