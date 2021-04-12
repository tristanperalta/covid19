defmodule Covid19.Repo.Migrations.CreateCovid19Observations do
  use Ecto.Migration

  def change do
    create table(:covid_observations) do
      add :observation_date, :date
      add :country, :string
      add :last_updated, :naive_datetime
      add :confirmed, :integer
      add :deaths, :integer
      add :recovered, :integer

      timestamps()
    end
  end
end
