class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

## TODO add your own Player subclasses here
## A player that stops when they get a particular score for a turn
class StopTwenty < Player
	def roll_again?
		super && @turn_score < 20
	end
end

## A player that changes strategies based on their current total score
class StrategicPlayer1 < Player
	def roll_again?
		super && ((@score >= 78 && @turn_score < 22) || @turn_score < 20)
	end
end

class StrategicPlayer2 < Player
	def roll_again?
		super && ((@score >= 78 && @turn_score < (100 - @score)) || @turn_score < 20)
	end
end

## A player that stops after a certain number of rolls
class LuckySeven < Player
  def start_turn
    super
    @rolls = 0
  end
  def record_roll(roll)
    super
    @rolls += 1
  end
  def roll_again?
    super && @rolls < 7
  end
end
