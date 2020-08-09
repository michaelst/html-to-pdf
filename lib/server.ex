defmodule HtmlToPdf.Greeter.Server do
  use GRPC.Server, service: HtmlToPdf.Converter.Service

  @spec convert(HtmlToPdf.HTMLRequest.t(), GRPC.Server.Stream.t()) :: HtmlToPdf.PDFReply.t()
  def convert(request, _stream) do
    with {:ok, filename} <- PdfGenerator.generate(request.html, page_size: "#{request.page_size}"),
         {:ok, bytes} <- File.read(filename),
         _ <- File.rm(filename) do
      HtmlToPdf.PDFReply.new(bytes: bytes)
    end
  end
end
