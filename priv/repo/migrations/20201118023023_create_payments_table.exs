defmodule DeliveryCenter.Repo.Migrations.CreatePaymentsTable do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key:  true)  do
      add :type, :string
      add :value, :float
      add :delivery_id, references(:delivery)
    end
  end
end
