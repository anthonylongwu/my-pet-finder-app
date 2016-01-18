class AddLocationToPets < ActiveRecord::Migration
  def change
    add_column :pets, :location, :string
  end
end
