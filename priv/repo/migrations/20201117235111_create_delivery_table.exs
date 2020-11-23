defmodule DeliveryCenter.Repo.Migrations.CreateDeliveryTable do
  use Ecto.Migration

  def change do
    create table(:delivery, primary_key:  true)  do
      add :externalCode, :string
      add :total_shipping, :string
      add :storeId, :integer
      add :subTotal, :string
      add :deliveryFee, :string
      add :total, :string
      add :country, :string
      add :state, :string
      add :city, :string
      add :district, :string
      add :street, :string
      add :complement, :string
      add :latitude, :float
      add :longitude, :float
      add :dtOrderCreate, :utc_datetime
      add :postalCode, :string
      add :number, :string
    end
  end
end
