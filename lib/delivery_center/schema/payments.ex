defmodule DeliveryCenter.Schema.Payments do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :type, :string
    field :value, :float

    belongs_to(:delivery, DeliveryCenter.Schema.Delivery)

  end

  @requerid_params [:type, :value]

  def changeset(payments, params) do
    payments
    |> cast(params, @requerid_params)
    |> validate_required(@requerid_params)
  end
end
