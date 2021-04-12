# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Covid19.Repo.insert!(%Covid19.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

IO.puts("seeding data")

File.stream!("priv/repo/covid_19_data.csv")
|> CSV.decode!(headers: true)
|> Enum.map(&Covid19.ImportHelper.cast/1)
|> IO.inspect()
