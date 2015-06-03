class CreateAngles < ActiveRecord::Migration
  def change
    create_table :angles do |t|
      t.references :vehicle, null: false
      t.string :name, limit: 100, null: false
      t.timestamps null: false
    end
  end
end