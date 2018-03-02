class CreateClassTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:name, :string)
      t.column(:style, :string)
      t.column(:price, :decimal, precision: 6, scale: 2)
    end

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
    end

    create_table(:inventories) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)
      t.column(:inventory, :integer)
    end
  end
end
