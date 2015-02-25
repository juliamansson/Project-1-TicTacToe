class RenameColumnsMatches < ActiveRecord::Migration
  def up
    rename_column :matches, :user_id_x, :user_x_id
    rename_column :matches, :user_id_o, :user_o_id
  end


  def down
    rename_column :matches, :user_x_id, :user_id_x
    rename_column :matches, :user_o_id, :user_id_o
  end
end
