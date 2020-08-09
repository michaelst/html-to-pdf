defmodule HtmlToPdf.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: GRPC.Server.Supervisor,
        start: {GRPC.Server.Supervisor, :start_link, [{HtmlToPdf.Endpoint, 50051}]}
      }
    ]

    opts = [strategy: :one_for_one, name: HtmlToPdf.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
