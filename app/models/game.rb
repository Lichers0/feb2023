class Game < ApplicationRecord
  has_many :player_achievements
  has_many :players, through: :player_achievements
  has_many :teams, through: :players

  validates :finished_at, presence: true
end
