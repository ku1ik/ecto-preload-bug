defmodule PreloadBug do
  alias PreloadBug.{Repo, Invoice, Attachment, Page, Vendor}

  ## this is OK

  # @preloads [
  #   [pages: [attachment: :pages]]
  # ]

  ## this is also OK

  # @preloads [
  #   :vendor,
  #   [pages: :attachment]
  # ]

  ## this causes huge mem usage spike (couple gigabytes!)

  @preloads [
    :vendor,
    [pages: [attachment: :pages]]
  ]

  def once do
    cleanup()
    invoice = setup()
    Repo.preload(invoice, @preloads)

    :ok
  end

  def twice do
    cleanup()
    invoice = setup()
    Repo.preload(Repo.preload(invoice, @preloads), @preloads)

    :ok
  end

  def twice_not_in_parallel do
    cleanup()
    invoice = setup()

    invoice
    |> Repo.preload(@preloads)
    |> Repo.preload(@preloads, in_parallel: false)

    :ok
  end

  def setup do
    vendor = Repo.insert!(%Vendor{name: "test", company_id: 1})
    invoice = Repo.insert!(%Invoice{number: "test", vendor_id: vendor.id})
    attachment = Repo.insert!(%Attachment{filename: "test.pdf"})

    for n <- 1..100 do
      Repo.insert!(%Page{number: n, invoice_id: invoice.id, attachment_id: attachment.id})
    end

    invoice
  end

  def cleanup do
    Repo.delete_all(Page)
    Repo.delete_all(Attachment)
    Repo.delete_all(Invoice)
  end
end
