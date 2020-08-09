# HtmlToPdf [![codecov](https://codecov.io/gh/michaelst/html-to-pdf/branch/master/graph/badge.svg)](https://codecov.io/gh/michaelst/html-to-pdf)

HTML to PDF gRPC microservice written in elixir with wkhtmltopdf.

## Usage

```
{:ok, channel} = GRPC.Stub.connect("localhost:50051")
request = HtmlToPdf.HTMLRequest.new(html: "<html><body><p>Hello world!</p></body></html>", page_size: :LETTER)
{:ok, reply} = channel |> HtmlToPdf.Converter.Stub.convert(request)
```

## Generate elixir code from proto

protoc -I priv/protos --elixir_out=plugins=grpc:./lib/ priv/protos/html_to_pdf.proto