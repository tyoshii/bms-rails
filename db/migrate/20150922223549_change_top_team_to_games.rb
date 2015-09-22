class ChangeTopTeamToGames < ActiveRecord::Migration
  def change
    rename_column :games, :top_team, :top_team_id
    rename_column :games, :bottom_team, :bottom_team_id
  end
end
