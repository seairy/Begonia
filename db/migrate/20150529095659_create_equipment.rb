class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.references :category, null: false
      t.string :name, limit: 100, null: false
      t.string :image, limit: 100
      t.text :description, limit: 30000
      t.timestamps null: false
    end
  end
end