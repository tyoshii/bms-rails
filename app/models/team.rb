class Team < ActiveRecord::Base
  serialize :admin
  validates :name, presence: true
  validates :admin, presence: true
end
