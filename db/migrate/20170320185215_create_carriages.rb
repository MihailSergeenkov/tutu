class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.references :train, foreign_key: true
      t.string :type_carriage
      t.integer :top_seats
      t.integer :bottom_seats

      t.timestamps
    end
  end
end
