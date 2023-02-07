describe Top5ForAchievement do
  subject(:top_players) { described_class.call(achievement, team) }

  let(:team1) { create(:team) }
  let(:team2) { create(:team) }

  let(:player1_team1) { create(:player, team: team1) }
  let(:player2_team1) { create(:player, team: team1) }
  let(:player3_team1) { create(:player, team: team1) }
  let(:player4_team1) { create(:player, team: team1) }
  let(:player5_team1) { create(:player, team: team1) }
  let(:player6_team1) { create(:player, team: team1) }

  let(:player1_team2) { create(:player, team: team2) }
  let(:player2_team2) { create(:player, team: team2) }
  let(:player3_team2) { create(:player, team: team2) }
  let(:player4_team2) { create(:player, team: team2) }
  let(:player5_team2) { create(:player, team: team2) }
  let(:player6_team2) { create(:player, team: team2) }

  let(:achievement1) { create(:achievement) }
  let(:achievement2) { create(:achievement) }

  let(:achievement) { achievement1 }

  before do
    game1 = create(:game)
    game2 = create(:game)
    game3 = create(:game)

    create(:player_achievement, game: game1, player: player1_team1, achievement: achievement1)
    create(:player_achievement, game: game2, player: player1_team1, achievement: achievement1)
    create(:player_achievement, game: game3, player: player1_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player1_team1, achievement: achievement2)
    create(:player_achievement, game: game2, player: player1_team1, achievement: achievement2)
    create(:player_achievement, game: game3, player: player1_team1, achievement: achievement2)

    create(:player_achievement, game: game1, player: player2_team1, achievement: achievement1)
    create(:player_achievement, game: game2, player: player2_team1, achievement: achievement1)
    create(:player_achievement, game: game3, player: player2_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player3_team1, achievement: achievement1)
    create(:player_achievement, game: game2, player: player3_team1, achievement: achievement1)
    create(:player_achievement, game: game3, player: player3_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player4_team1, achievement: achievement1)
    create(:player_achievement, game: game2, player: player4_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player5_team1, achievement: achievement1)
    create(:player_achievement, game: game2, player: player5_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player6_team1, achievement: achievement1)

    create(:player_achievement, game: game1, player: player1_team2, achievement: achievement1)
    create(:player_achievement, game: game2, player: player1_team2, achievement: achievement1)
    create(:player_achievement, game: game3, player: player1_team2, achievement: achievement1)

    create(:player_achievement, game: game1, player: player2_team2, achievement: achievement1)
    create(:player_achievement, game: game2, player: player2_team2, achievement: achievement1)
    create(:player_achievement, game: game3, player: player2_team2, achievement: achievement1)
  end

  context 'when team is empty' do
    let(:team) { nil }
    let(:correct_result) { [player1_team1.id, player2_team1.id, player3_team1.id, player1_team2.id, player2_team2.id] }

    it 'gets the total rating' do
      expect(top_players.map(&:id)).to eq correct_result
    end
  end

  context 'when selecting a rating for a team' do
    let(:team) { team1 }
    let(:correct_result) { [player1_team1.id, player2_team1.id, player3_team1.id, player4_team1.id, player5_team1.id] }

    it 'gets the rating for the team' do
      expect(top_players.map(&:id)).to eq correct_result
    end
  end
end
