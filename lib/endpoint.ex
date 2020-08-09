defmodule HtmlToPdf.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(HtmlToPdf.Greeter.Server)
end
