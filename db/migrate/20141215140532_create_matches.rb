class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id_x
      t.integer :user_id_o
      t.integer :winner_id

      t.timestamps
    end
  end
end
