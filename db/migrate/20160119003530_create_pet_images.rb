class CreatePetImages < ActiveRecord::Migration
  def change
    create_table :pet_images do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end