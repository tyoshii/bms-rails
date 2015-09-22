module GamesHelper
  def get_team_name_by_id(id)
    return '' unless id
    Team.find(id).name
  end
end
