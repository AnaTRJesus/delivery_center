defmodule DeliveryCenter.Repo.Migrations.CreateCustomerTable do
  use Ecto.Migration

  def change do
    create table(:customer, primary_key: true) do
      add :externalCode, :string
      add :name, :string
      add :email, :string
      add :contact, :string

      add :delivery_id, references(:delivery)

    end
  end
end
