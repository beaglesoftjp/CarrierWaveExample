class CreatePictureStores < ActiveRecord::Migration
  def change
    create_table :picture_stores do |t|
      t.string :store_name
      t.string :picture

      t.timestamps null: false
    end
  end
end
