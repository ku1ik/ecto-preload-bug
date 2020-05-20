defmodule Mix.Tasks.Exprof do
  @shortdoc "Profile using ExProf"
  use Mix.Task
  import ExProf.Macro

  def run(mix_args) do
    Mix.Tasks.App.Start.run(mix_args)

    invoice_preloaded =
      PreloadBug.setup()
      |> PreloadBug.Repo.preload([
        :vendor,
        [pages: [attachment: :pages]]
      ])

    profile(do: do_work(invoice_preloaded))
  end

  defp do_work(invoice) do
    invoice
    |> PreloadBug.Repo.preload([
      :vendor,
      [pages: [attachment: :pages]]
    ])
  end
end
