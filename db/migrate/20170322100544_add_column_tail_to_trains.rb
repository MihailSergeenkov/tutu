class AddColumnTailToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :tail, :boolean, default: false
  end
end
