class Game < ActiveRecord::Base
  validates :date, presence: true
  validates :start_time, presence: true
  validates :stadium, presence: true
  validates :top_team, presence: true
  validates :bottom_team, presence: true
end
