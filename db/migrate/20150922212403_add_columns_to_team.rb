class AddColumnsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :admin, :text
  end
end
