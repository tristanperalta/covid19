defmodule Covid19.ImportHelper do
  def cast(data) do
    %{
      observation_date: data["ObservationDate"],
      country: data["Country/Region"],
      last_updated: data["Last Updated"],
      confirmed: data["Confirmed"],
      deaths: data["Deaths"],
      recovered: data["Recovered"]
    }
  end
end
