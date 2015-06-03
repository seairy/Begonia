class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name, limit: 200, null: false
      t.boolean :visible, null: false
      t.timestamps null: false
    end
  end
end