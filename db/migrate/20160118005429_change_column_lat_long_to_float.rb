class ChangeColumnLatLongToFloat < ActiveRecord::Migration
  def change
    change_column :pets, :latitude, :float
    change_column :pets, :longitude, :float
  end
end
