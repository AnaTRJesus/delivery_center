defmodule DeliveryCenter.Schema.Delivery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "delivery" do
    field :externalCode, :string
    field :total_shipping, :string
    field :storeId, :integer
    field :subTotal, :string
    field :deliveryFee, :string
    field :total, :string
    field :country, :string
    field :state, :string
    field :city, :string
    field :district, :string
    field :street, :string
    field :complement, :string
    field :latitude, :float
    field :longitude, :float
    field :dtOrderCreate, :utc_datetime
    field :postalCode, :string
    field :number, :string

    has_many(:payments, DeliveryCenter.Schema.Payments)
    has_one(:customer, DeliveryCenter.Schema.Customer)
    has_many(:items, DeliveryCenter.Schema.Items)



  end

  @requerid_params [:externalCode, :storeId, :subTotal, :deliveryFee, :total, :country,
  :state, :city, :district, :street, :complement, :latitude, :longitude, :dtOrderCreate,
  :postalCode, :number, :total_shipping]

  def changset(delivery,params) do
    delivery
    |> cast(params, @requerid_params)
    |> validate_required( @requerid_params)
    |> cast_assoc(:payments, required: true, with: &DeliveryCenter.Schema.Payments.changeset/2)
    |> cast_assoc(:customer, required: true, with: &DeliveryCenter.Schema.Customer.changeset/2)
    |> cast_assoc(:items, required: true, with: &DeliveryCenter.Schema.Items.changeset/2)
  end

  def build(params) do
    apply_action(changset(%DeliveryCenter.Schema.Delivery{}, params), :build)
  end

end
