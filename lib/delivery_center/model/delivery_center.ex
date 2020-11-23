defmodule DeliveryCenter.Model.DeliveryCenter do
    alias DeliveryCenter.Gateway.DeliveryCenterGateway, as: Gateway
    alias DeliveryCenter.Schema.Delivery


    def send_delivery(params) do
        with {:ok, response} <- Gateway.call(params) do
            {response.status_code, response.body}
        end
    end

    def build_delivery(params) do
        params
        |> Delivery.build()
    end
end
