class AddColumnPositionToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :position, :integer
  end
end
