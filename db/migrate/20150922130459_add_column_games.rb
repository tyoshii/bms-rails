class AddColumnGames < ActiveRecord::Migration
  def up
    add_column :games, :top_team, :string
    add_column :games, :bottom_team, :string
  end

  def down
    remove_column :games, :top_team, :string
    remove_column :games, :bottom_team, :string
  end
end
