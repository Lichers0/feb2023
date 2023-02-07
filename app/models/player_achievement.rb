class PlayerAchievement < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :achievement

  has_one :team, through: :player
end
