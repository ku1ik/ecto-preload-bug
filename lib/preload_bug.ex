defmodule PreloadBug do
  alias PreloadBug.{Repo, Invoice, Attachment, Page}

  @preloads [
    # [attachments: :pages],
    # :pages,
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

  defp setup do
    invoice = Repo.insert!(%Invoice{number: "test"})
    attachment = Repo.insert!(%Attachment{filename: "test.pdf"})

    for n <- 1..100 do
      Repo.insert!(%Page{number: n, invoice_id: invoice.id, attachment_id: attachment.id})
    end

    invoice
  end

  defp cleanup do
    Repo.delete_all(Page)
    Repo.delete_all(Attachment)
    Repo.delete_all(Invoice)
  end
end
