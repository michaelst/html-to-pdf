defmodule HtmlToPdf.HTMLRequest.PageSize do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :LETTER
          | :A0
          | :A1
          | :A2
          | :A3
          | :A4
          | :A5
          | :A6
          | :A7
          | :A8
          | :A9
          | :B0
          | :B1
          | :B2
          | :B3
          | :B4
          | :B5
          | :B6
          | :B7
          | :B8
          | :B9
          | :B10
          | :C5E
          | :COMM10E
          | :DLE
          | :EXECUTIVE
          | :FOLIO
          | :LEGAL
          | :LEGDER
          | :TABLOID

  field :LETTER, 0
  field :A0, 1
  field :A1, 2
  field :A2, 3
  field :A3, 4
  field :A4, 5
  field :A5, 6
  field :A6, 7
  field :A7, 8
  field :A8, 9
  field :A9, 10
  field :B0, 11
  field :B1, 12
  field :B2, 13
  field :B3, 14
  field :B4, 15
  field :B5, 16
  field :B6, 17
  field :B7, 18
  field :B8, 19
  field :B9, 20
  field :B10, 21
  field :C5E, 22
  field :COMM10E, 23
  field :DLE, 24
  field :EXECUTIVE, 25
  field :FOLIO, 26
  field :LEGAL, 27
  field :LEGDER, 28
  field :TABLOID, 29
end

defmodule HtmlToPdf.HTMLRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          html: String.t(),
          page_size: HtmlToPdf.HTMLRequest.PageSize.t()
        }
  defstruct [:html, :page_size]

  field :html, 1, type: :string
  field :page_size, 2, type: HtmlToPdf.HTMLRequest.PageSize, enum: true
end

defmodule HtmlToPdf.PDFReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          binary: String.t()
        }
  defstruct [:binary]

  field :binary, 1, type: :string
end

defmodule HtmlToPdf.Converter.Service do
  @moduledoc false
  use GRPC.Service, name: "html_to_pdf.Converter"

  rpc :Convert, HtmlToPdf.HTMLRequest, HtmlToPdf.PDFReply
end

defmodule HtmlToPdf.Converter.Stub do
  @moduledoc false
  use GRPC.Stub, service: HtmlToPdf.Converter.Service
end
