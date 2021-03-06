defmodule Catuum.Mixfile do
  use Mix.Project

  def project do
    [app: :catuum,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      mod: {Catuum, []},
      applications: [:logger, :httpotion, :quantum, :poison, :mogrify]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpotion, github: "myfreeweb/httpotion"},
      {:quantum, ">= 1.7.1"},
      {:poison, "~> 2.0"},
      {:mogrify, "~> 0.3.1"},
      {:exrm, "~> 1.0.5"},
      {:cf, "~> 0.2.1", override: true},
      {:erlware_commons, github: "erlware/erlware_commons", override: true}
    ]
  end
end
