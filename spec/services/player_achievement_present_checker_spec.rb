describe PlayerAchievementPresentChecker do
  subject(:present_checker) { described_class.call(player, achievement) }

  describe '.call' do
    let(:player) { create :player }
    let(:achievement) { create :achievement, title: 'Test check' }

    context 'when player has achievement last 5 games' do
      before do
        5.times do
          game = create :game
          create(:player_achievement, game:, player:)
        end

        game = create :game
        create(:player_achievement, game:, player:, achievement:)
      end

      it { is_expected.to be_truthy }
    end

    context 'when player does not have achievement last 5 games' do
      before do
        game = create :game
        create(:player_achievement, game:, player:, achievement:)

        5.times do
          game = create(:game)
          create(:player_achievement, game:, player:)
        end
      end

      it { is_expected.to be_falsy }
    end
  end
end
