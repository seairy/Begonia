class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :angle, null: false
      t.string :name, limit: 100, null: false
      t.string :image, limit: 100
      t.timestamps null: false
    end
  end
end