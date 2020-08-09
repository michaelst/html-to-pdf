defmodule HtmlToPdfTest do
  use ExUnit.Case

  test "generate pdf from html" do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")

    request =
      HtmlToPdf.HTMLRequest.new(
        html: "<html><body><p>Hello world!</p></body></html>",
        page_size: :LETTER
      )

    assert {:ok, reply} = channel |> HtmlToPdf.Converter.Stub.convert(request)
    assert byte_size(reply.bytes) >= 5234
  end
end
