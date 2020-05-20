require Logger

PreloadBug.cleanup()

log_step = fn x, msg ->
  Logger.info(msg)
  x
end

swallow = fn _ -> nil end
Logger.info("")

(fn ->
   PreloadBug.setup()
   |> log_step.("###### Start ###### ")
   |> log_step.("###### Preloading first time ###### ")
   |> PreloadBug.Repo.preload([
     :vendor,
     [pages: [attachment: :pages]]
   ])
   |> log_step.("###### Preloading second time ###### ")
   |> PreloadBug.Repo.preload([
     :vendor,
     [pages: [attachment: :pages]]
   ])
   |> log_step.("###### Done ######")
   |> swallow.()
 end).()
