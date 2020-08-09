# HtmlToPdf

HTML to PDF gRPC microservice written in elixir with wkhtmltopdf.

## Run

```
{:ok, channel} = GRPC.Stub.connect("localhost:50051")
request = HtmlToPdf.HTMLRequest.new(html: "<html><body><p>Hello world!</p></body></html>", page_size: :LETTER)
{:ok, reply} = channel |> HtmlToPdf.Converter.Stub.convert(request)

protoc -I priv/protos --elixir_out=plugins=grpc:./lib/ priv/protos/html_to_pdf.proto