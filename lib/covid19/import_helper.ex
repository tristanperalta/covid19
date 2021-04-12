defmodule Covid19.ImportHelper do
  def cast(data) do
    %{
      observation_date: parse_date(data["ObservationDate"]),
      country: data["Country/Region"],
      # last_updated: data["Last Update"],
      confirmed: parse_int(data["Confirmed"]),
      deaths: parse_int(data["Deaths"]),
      recovered: parse_int(data["Recovered"])
    }
  end

  def parse_int(data) do
    {int, _} = Integer.parse(data)
    int
  end

  def parse_date(date, delim \\ "/") do
    date
    |> String.split(delim)
    |> Enum.map(&parse_int/1)
    |> (fn
          [month, day, year] ->
            Date.new!(year, month, day)

          _ ->
            Date.utc_today()
        end).()
  end

  def parse_time(time) do
    time
    |> String.split(":")
    |> Enum.map(&parse_int/1)
    |> (fn [hour, min] ->
          Time.new!(hour, min, 0)
        end).()
  end

  def parse_datetime(nil), do: nil

  def parse_datetime(datetime) do
    [date, time] = String.split(datetime)

    date = parse_date(date, "-")
    time = parse_time(time)
    NaiveDateTime.new!(date, time)
  end
end
