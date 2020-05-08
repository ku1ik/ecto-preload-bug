defmodule PreloadBug.Vendor do
  use Ecto.Schema

  schema "vendors" do
    field :name, :string
    field :company_id, :integer

    timestamps()
  end
end
