# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   
#   Создать в seeds набор данных (2 команды, 3 игрока в каждой, 2 показателя, 3 матча, 
#   несколько показателей для различных игроков).

team1 = Team.create(name: "team1")

player1 = Player.create(name: "Tom", team: team1)
player2 = Player.create(name: "Bob", team: team1)
player3 = Player.create(name: "Mike", team: team1)

team2 = Team.create(name: "team2")

player4 = Player.create(name: "Ted", team: team2)
player5 = Player.create(name: "John", team: team2)
player6 = Player.create(name: "Luke", team: team2)

achievement1 = Achievement.create(title: "Ran more then 10 km.")
achievement2 = Achievement.create(title: "Made over 70% accurate passes.")

game1 = Game.create(title: "Game 1", finished_at: 1.day.ago)
game2 = Game.create(title: "Game 2", finished_at: 2.days.ago)
game3 = Game.create(title: "Game 3", finished_at: 3.days.ago)

PlayerAchievement.create(player: player1, game: game1, achievement: achievement1)
PlayerAchievement.create(player: player2, game: game1, achievement: achievement1)
PlayerAchievement.create(player: player3, game: game1, achievement: achievement2)
PlayerAchievement.create(player: player4, game: game1, achievement: achievement2)
PlayerAchievement.create(player: player5, game: game1, achievement: achievement1)
PlayerAchievement.create(player: player6, game: game1, achievement: achievement2)

PlayerAchievement.create(player: player1, game: game2, achievement: achievement1)
PlayerAchievement.create(player: player1, game: game2, achievement: achievement2)
PlayerAchievement.create(player: player2, game: game2, achievement: achievement1)
PlayerAchievement.create(player: player2, game: game2, achievement: achievement2)
PlayerAchievement.create(player: player5, game: game2, achievement: achievement1)
PlayerAchievement.create(player: player5, game: game2, achievement: achievement2)
PlayerAchievement.create(player: player6, game: game2, achievement: achievement1)

PlayerAchievement.create(player: player3, game: game3, achievement: achievement2)
PlayerAchievement.create(player: player5, game: game3, achievement: achievement2)
