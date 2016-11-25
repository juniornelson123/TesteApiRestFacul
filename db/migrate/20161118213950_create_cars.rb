class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :year
      t.string :color
      t.string :board

      t.timestamps
    end
  end
end
