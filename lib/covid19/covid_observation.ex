defmodule Covid19.CovidObservation do
  use Ecto.Schema

  schema "covid_observations" do
    field :observation_date, :date
    field :country, :string
    field :last_updated, :naive_datetime
    field :confirmed, :integer
    field :deaths, :integer
    field :recovered, :integer

    timestamps()
  end
end
