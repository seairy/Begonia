class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :angle, null: false
      t.string :code, limit: 200, null: false
      t.string :file, limit: 100, null: false
      t.timestamps null: false
    end
  end
end