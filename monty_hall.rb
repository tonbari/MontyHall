class MontyHall
  attr_reader :wins, :losses

  def initialize(change_choice)
    @wins = 0
    @losses = 0
    @change_choice = change_choice
  end

  def play(num_games)
    num_games.times do
      car_position = rand(1..3)
      gamer_first_choice = rand(1..3)
      showman_choice = showman_reveal(gamer_first_choice, car_position)

      gamer_second_choice = if @change_choice == 1
                              change_choice(gamer_first_choice, showman_choice)
                            else
                              gamer_first_choice
                            end

      record_result(gamer_second_choice, car_position)
      end
  end


  def showman_reveal(gamer_choice, car_position)
    choice = rand(1..3)
    while choice == gamer_choice || choice == car_position
      choice = rand(1..3)
    end
    choice
  end

  def change_choice(gamer_choice, showman_choice)
        choices = [1, 2, 3]
        gamer_second_choice = (choices - [gamer_choice, showman_choice]).first
  end

  def record_result(gamer_second_choice, car_position)
      if gamer_second_choice == car_position
        @wins += 1
      else
        @losses += 1
      end
    end
  end

game = MontyHall.new(1)
game.play(10000)
puts "Gamer wins #{game.wins} times."
puts "Gamer loses #{game.losses} times."