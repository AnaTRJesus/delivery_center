defmodule DeliveryCenterWeb.DeliveryController do
  alias DeliveryCenter.Repo
  alias DeliveryCenter.Model.DeliveryCenter
  use DeliveryCenterWeb, :controller

  action_fallback DeliveryCenterWeb.FallbackController

  def delivery_post(conn, params) do
    params
    |> delivery_parse()
    |> DeliveryCenter.build_delivery()
    |> save_delivery(conn,params)
  end

  defp save_delivery({:ok, struct}, conn, params) do
    with {:ok, _response} <- Repo.insert(struct) do
      send_delivery(DeliveryCenter.send_delivery(delivery_parse(params)), conn)
    end
  end

  defp save_delivery({:error, _changset} = error, _conn, _params), do: error

  defp send_delivery({200, response}, conn) do
    IO.inspect(response)
    conn
    |> put_status(:ok)
    |> json("ok")
  end

  defp send_delivery({status, response}, conn) do
    conn
    |> put_status(status)
    |> json(response)
  end

  def delivery_parse(params) do

    %{
      "total_shipping" => Float.to_string(params["total_shipping"]),
      "externalCode" => Integer.to_string(params["id"]),
      "storeId" => params["store_id"],
      "deliveryFee" => Float.to_string(params["total_shipping"]),
      "subTotal" => Float.to_string(params["total_amount"]),
      "total" => Float.to_string(params["total_amount_with_shipping"]),
      "country" => params["shipping"]["receiver_address"]["country"]["id"],
      "state" => params["shipping"]["receiver_address"]["state"]["name"],
      "city" => params["shipping"]["receiver_address"]["city"]["name"],
      "district" => params["shipping"]["receiver_address"]["neighborhood"]["name"],
      "street" => params["shipping"]["receiver_address"]["street_name"],
      "latitude" => params["shipping"]["receiver_address"]["latitude"],
      "longitude" => params["shipping"]["receiver_address"]["longitude"],
      "dtOrderCreate" => params["date_created"],
      "postalCode" => params["shipping"]["receiver_address"]["zip_code"],
      "complement" => params["shipping"]["receiver_address"]["comment"],
      "number" =>  params["shipping"]["receiver_address"]["street_number"],
      "payments" => Enum.map(params["payments"],
      fn x ->
      %{
        "type" => x["payment_type"],
        "value" => 55.04
      } end),
      "customer" => %{
        "externalCode" => Integer.to_string(params["buyer"]["id"]),
        "name" => params["buyer"]["nickname"],
        "email" => params["buyer"]["email"],
        "contact" => params["buyer"]["phone"]["number"]
      },
      "items" => Enum.map(params["order_items"],
      fn x ->
      %{
        "externalCode" => x["item"]["id"],
        "name" => x["item"]["title"],
        "price" => x["unit_price"],
        "quantity" => x["quantity"],
        "total" => x["full_unit_price"],
        "subItems" => []
      }end)
    }
  end
end
