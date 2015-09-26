class Game < ActiveRecord::Base
  serialize :rs

  validates :date, presence: true
  validates :start_time, presence: true
  validates :stadium, presence: true
  validates :top_team_id, presence: true
  validates :bottom_team_id, presence: true
end
