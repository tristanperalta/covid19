defmodule Covid19Web.ObservationController do
  use Covid19Web, :controller

  def index(conn, params) do
    conn
    |> json(results(params))
  end

  defp results(params) do
    %{
      observation_date: params["observation_date"],
      countries: top_countries(params)
    }
  end

  defp top_countries(%{"observation_date" => observation_date, "max_results" => max_results}) do
    Covid19.CovidObservation.top(observation_date, max_results)
    |> Covid19.Repo.all()
  end

  defp top_countries(%{"observation_date" => observation_date}) do
    Covid19.CovidObservation.top(observation_date)
    |> Covid19.Repo.all()
  end

  defp top_countries(_), do: []
end
