class Top5ForAchievement
  def self.call(achievement, team = nil)
    result = Player
      .select('players.*, count(achievement_id) as total')
      .joins(:player_achievements)
      .where('player_achievements.achievement_id = ?', achievement)
      .group('players.id')
      .order('count(achievement_id) desc, players.id')
      .limit(5)

    result = result.where(team:) if team

    result
  end
end
