defmodule HtmlToPdf.Greeter.Server do
  use GRPC.Server, service: HtmlToPdf.Converter.Service

  alias HtmlToPdf.HTMLRequest
  alias HtmlToPdf.PDFReply

  @spec convert(HTMLRequest.t(), GRPC.Server.Stream.t()) :: PDFReply.t()
  def convert(%HTMLRequest{html: html, page_size: page_size}, _stream) do
    with {:ok, filename} <- PdfGenerator.generate(html, page_size: "#{page_size}"),
         {:ok, bytes} <- File.read(filename),
         _ <- File.rm(filename) do
      PDFReply.new(bytes: bytes)
    else
      _ -> raise GRPC.RPCError, status: :unknown
    end
  end
end
