defmodule DeliveryCenter.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  def change do
    create table(:items, primary_key:  true)  do
      add :externalCode, :string
      add :name, :string
      add :price, :float
      add :quantity, :integer
      add :total, :float

      add :delivery_id, references(:delivery)

    end
  end
end
