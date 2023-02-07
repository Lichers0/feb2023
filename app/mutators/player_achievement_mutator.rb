class PlayerAchievementMutator
  def self.create(params)
    game = Game.find(params[:id])
    player = Player.find(params[:player_id])
    achievement = Achievement.find(params[:achievement_id])

    PlayerAchievement.create!(player:, game:, achievement:)
  end
end
