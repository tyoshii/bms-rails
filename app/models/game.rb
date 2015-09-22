class Game < ActiveRecord::Base
  validates :date, presence: true
  validates :start_time, presence: true
  validates :stadium, presence: true
end
