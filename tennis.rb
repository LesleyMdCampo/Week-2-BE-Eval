module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      winner.points += 1
    end
  end

  class Player
    attr_accessor :points, :opponent, :games

    def initialize
      @points = 0
      @games = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3 && @opponent.points < 3
      return 'duece' if @points >= 3 && @points == @opponent.points
      return 'advantage' if @points >= 4 && @points == @opponent.points + 1
      win_game
    end
    
    # Records a win for a game. 
    #
    # Returns name of winning player. 

    def win_game
      if @points >= 4 && @points >= @opponent.points + 2
        @games += 1
      end
    end
  end
end