defmodule DeliveryCenter.Schema.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customer" do
    field :externalCode, :string
    field :name, :string
    field :email, :string
    field :contact, :string

    belongs_to(:delivery, DeliveryCenter.Schema.Delivery)

  end

  @requerid_params [:externalCode, :name, :email, :contact]

  def changeset(customer, params) do
    customer
    |> cast(params, @requerid_params)
    |> validate_required(@requerid_params)
  end
end
