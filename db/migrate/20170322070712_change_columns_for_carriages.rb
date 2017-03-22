class ChangeColumnsForCarriages < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :type_carriage, :type
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :seats, :integer
    add_column :carriages, :number, :integer
  end
end
