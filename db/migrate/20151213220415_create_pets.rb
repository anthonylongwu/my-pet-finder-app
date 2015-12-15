class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :animal
      t.string :breed
      t.string :color
      t.string :size
      t.string :weight
      t.boolean :micro_chip
      t.text :description

      t.timestamps null: true
    end
  end
end
