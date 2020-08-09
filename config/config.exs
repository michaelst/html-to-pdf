use Mix.Config

config :grpc, start_server: true

config :pdf_generator,
  raise_on_missing_wkhtmltopdf_binary: true

import_config "#{Mix.env()}.exs"
