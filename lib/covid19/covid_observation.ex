defmodule Covid19.CovidObservation do
  use Ecto.Schema

  import Ecto.Query

  schema "covid_observations" do
    field :observation_date, :date
    field :country, :string
    field :last_updated, :naive_datetime
    field :confirmed, :integer
    field :deaths, :integer
    field :recovered, :integer

    timestamps()
  end

  def top(observation_date, max_results \\ nil) do
    __MODULE__
    |> where(observation_date: ^observation_date)
    |> group_by([o], [o.observation_date, o.country])
    |> select([o], %{
      country: o.country,
      confirmed: sum(o.confirmed),
      recovered: sum(o.recovered),
      deaths: sum(o.deaths)
    })
    |> order_by([o], desc: sum(o.confirmed))
    |> max_results(max_results)
  end

  defp max_results(query, nil), do: query

  defp max_results(query, count) do
    limit(query, ^count)
  end
end
