class ChangeColumnNameMoves < ActiveRecord::Migration
  def change
    rename_column :moves, :value_id, :value
    
  end
end
