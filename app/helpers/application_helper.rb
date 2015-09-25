module ApplicationHelper
  def get_name_by_team_id(id)
    team = Team.find_by_id(id)
    team ? team.name : ''
  end
end
