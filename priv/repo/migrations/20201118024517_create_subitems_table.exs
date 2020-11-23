defmodule DeliveryCenter.Repo.Migrations.CreateSubitemsTable do
  use Ecto.Migration

  def change do
    create table(:subitems, primary_key:  true)  do
      add :items_id, references(:items)
    end
  end
end
