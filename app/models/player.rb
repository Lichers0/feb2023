class Player < ApplicationRecord
  belongs_to :team
  has_many :player_achievements
  has_many :games, through: :player_achievements
end
