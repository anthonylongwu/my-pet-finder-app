class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :phone, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
