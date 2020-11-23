defmodule DeliveryCenter.Gateway.DeliveryCenterGateway do
  use HTTPoison.Base

  def call(body) do
    HTTPoison.post("https://delivery-center-recruitment-ap.herokuapp.com/", Poison.encode!(body), create_header())
  end

  defp create_header() do
    [{"content-type", "application/json"}]
    [{"X-Sent", formate_date(DateTime.utc_now)}]
  end

  def formate_date(date) do
    "#{date.hour}h#{date.minute} - #{date.day}/#{date.month}/#{date.year}"
  end
end
