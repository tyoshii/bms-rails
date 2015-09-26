class AddColumnsToGame < ActiveRecord::Migration
  def change
    add_column :games, :rs, :text
    add_column :games, :last_inning, :integer
  end
end
