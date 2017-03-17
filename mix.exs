defmodule Ryal.Mixfile do
  @applications [:ryal_core]
  @version "0.0.1"

  use Mix.Project

  def project do
    [
      app: :ryal,
      description: "The core of Ryal.",
      version: @version,
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      applications: @applications,
      package: package()
    ]
  end

  def application, do: [extra_applications: [:logger]]
  defp deps, do: Enum.map(@applications, &({&1, @version})) ++ dev_deps()

  defp dev_deps do
    [{:ex_doc, "~> 0.14", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Ben A. Morgan"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/ryal/hex"},
      files: ~w(lib mix.exs LICENSE.txt README.md)
    ]
  end
end
