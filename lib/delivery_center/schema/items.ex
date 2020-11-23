defmodule DeliveryCenter.Schema.Items do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :externalCode, :string
    field :name, :string
    field :price, :float
    field :quantity, :integer
    field :total, :float

    belongs_to(:delivery, DeliveryCenter.Schema.Delivery)
    has_many(:subitems, DeliveryCenter.Schema.Subitems)
  end


  @requerid_params [:externalCode, :name, :price, :quantity, :total]

  def changeset(items,params) do
    items
    |> cast(params, @requerid_params)
    |> validate_required(@requerid_params)
  end
end
