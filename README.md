To reprodue the bug:

1. `git clone git@github.com:sickill/ecto-preload-bug.git`
2. `cd ecto-preload-bug`
3. `mix do deps.get, ecto.create, ecto.migrate`
4. `iex -S mix`
5. `:observer.start`, switch to "Load Charts" tab
6. `PreloadBug.once` - this preloads once, no memory spike should be observed
7. `PreloadBug.twice` - this runs the same preload on alrady preload schema - observe huge memory spike, ~1 GB in this example project. In the project I discovered it we see 3-5 GB spike.
