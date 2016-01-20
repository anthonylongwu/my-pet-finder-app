class ChangeIdtoPetImage < ActiveRecord::Migration
  def change
    rename_column :pet_images, :user_id, :pet_id
  end
end
