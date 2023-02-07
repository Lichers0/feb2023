class PlayerAchievementPresentChecker
  def self.call(player, achievement)
    team_last_5_games = Game.joins(:teams).where(teams: player.team).order(created_at: :desc).distinct.limit(5)

    PlayerAchievement.where(player:, achievement:, game: team_last_5_games).present?
  end
end
