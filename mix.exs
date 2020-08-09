defmodule HtmlToPdf.MixProject do
  use Mix.Project

  def project do
    [
      app: :html_to_pdf,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HtmlToPdf.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # 2.9.0 fixes some important bugs, so it's better to use ~> 2.9.0
      {:cowlib, "~> 2.9.0", override: true},
      {:grpc, github: "elixir-grpc/grpc"},
      {:pdf_generator, ">= 0.6.2"}
    ]
  end
end
