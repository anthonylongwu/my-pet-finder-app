class AddColumnToPets < ActiveRecord::Migration
  def change
    add_column :pets, :latitude, :decimal
    add_column :pets, :longitude, :decimal
    add_column :pets, :cross_street, :string
    add_column :pets, :status, :string
    add_column :pets, :resolved, :boolean
    add_column :pets, :image, :string
    add_column :pets, :name, :string
    
  


  end
end
