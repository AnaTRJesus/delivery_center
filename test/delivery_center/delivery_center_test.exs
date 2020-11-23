defmodule DeliveryCenter.DeliveryTest do
  alias DeliveryCenter.Gateway.DeliveryCenterGateway, as: Gateway
  alias DeliveryCenter.Model.DeliveryCenter, as: Model
  alias DeliveryCenterWeb.DeliveryController, as: Controller
  use ExUnit.Case


  test "verify_format_date" do
    date = DateTime.utc_now
    assert Gateway.formate_date(date) == "#{date.hour}h#{date.minute} - #{date.day}/#{date.month}/#{date.year}"
  end

  test "build_delivery_build_with_sucess" do
    assert Controller.delivery_parse(delivery_input()) ==  delivery_output()
  end

  def find_response() do
    with {:ok, response} <- Model.build_delivery(delivery_output) do
      response
    end
  end

  def delivery_input() do
    %{
      "id" => 9987071,
      "store_id" => 282,
      "date_created" => "2019-06-24T16:45:32.000-04:00",
      "date_closed" => "2019-06-24T16:45:32.000-04:00",
      "last_updated" => "2019-06-24T16:45:32.000-04:00",
      "total_amount" => 49.9,
      "total_amount_with_shipping" => 55.04,
      "paid_amount" => 55.04,
      "expiration_date" => "2019-06-24T16:45:32.000-04:00",
      "total_shipping" => 5.14,
      "order_items" => [
        %{
          "item" => %{
            "id" => "IT4801901403",
            "title" => "Produto de Testes"
          },
          "quantity" => 1,
          "unit_price" => 49.9,
          "full_unit_price" => 49.9
        }
      ],
      "payments" => [
        %{
          "id" => 12312313,
          "order_id" => 9987071,
          "payer_id" => 414138,
          "installments" => 1,
          "payment_type" => "credit_card",
          "status" => "paid",
          "transaction_amount" => 49.9,
          "taxes_amount" => 0,
          "shipping_cost" => 5.14,
          "total_paid_amount" => 55.04,
          "installment_amount" => 55.04,
          "date_approved" => "2019-06-24T16:45:32.000-04:00",
          "date_created" => "2019-06-24T16:45:32.000-04:00"
        }
      ],
      "shipping" => %{
        "id" => 43444211797,
        "shipment_type" => "shipping",
        "date_created" => "2019-06-24T16:45:32.000-04:00",
        "receiver_address" => %{
          "id" => 1051695306,
          "address_line" => "Rua Fake de Testes 3454",
          "street_name" => "Rua Fake de Testes",
          "street_number" => "3454",
          "comment" => "teste",
          "zip_code" => "85045020",
          "city" => %{
            "name" =>"Cidade de Testes"
          },
          "state" => %{
            "name" => "Sao Paulo"
          },
          "country" => %{
            "id" => "BR",
            "name" => "Brasil"
          },
          "neighborhood" => %{
            "id" => nil,
            "name" => "Vila de Testes"
          },
          "latitude" => -23.629037,
          "longitude" => -46.712689,
          "receiver_phone" => "41999999999"
        }
      },
      "status" =>"paid",
      "buyer" => %{
        "id" => 136226073,
        "nickname" => "JOHN DOE",
        "email" => "john@doe.com",
        "phone" => %{
          "area_code" => 41,
          "number" => "999999999"
        },
        "first_name" => "John",
        "last_name" => "Doe",
        "billing_info" => %{
          "doc_type" => "CPF",
          "doc_number" => "09487965477"
        }
      }
    }
  end

  def delivery_output() do
    %{
      "city" => "Cidade de Testes",
      "complement" => "teste",
      "country" => "BR",
      "customer" => %{
        "contact" => "999999999",
        "email" => "john@doe.com",
        "externalCode" => "136226073",
        "name" => "JOHN DOE"
      },
      "deliveryFee" => "5.14",
      "district" => "Vila de Testes",
      "dtOrderCreate" => "2019-06-24T16:45:32.000-04:00",
      "externalCode" => "9987071",
      "items" => [
        %{
          "externalCode" => "IT4801901403",
          "name" => "Produto de Testes",
          "price" => 49.9,
          "quantity" => 1,
          "subItems" => [],
          "total" => 49.9
        }
      ],
      "latitude" => -23.629037,
      "longitude" => -46.712689,
      "number" => "3454",
      "payments" => [%{"type" => "credit_card", "value" => 55.04}],
      "postalCode" => "85045020",
      "state" => "Sao Paulo",
      "storeId" => 282,
      "street" => "Rua Fake de Testes",
      "subTotal" => "49.9",
      "total" => "55.04",
      "total_shipping" => "5.14"
    }
  end
end
