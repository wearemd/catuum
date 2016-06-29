# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :quantum, cron: [
  download_random_cat: [
    schedule: "* * * * *",
    task: "Vigil.FeedStore.process_feed"
  ]
]