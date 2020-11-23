defmodule DeliveryCenter.Schema.Subitems do
  use Ecto.Schema

  schema "subitems" do

    belongs_to(:items, DeliveryCenter.Schema.Items)
  end
end
