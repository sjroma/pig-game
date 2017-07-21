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
## StopScore20Players stops rolling when turn score is greater than 20
class Hold20Play1 < Player
	def roll_again?
		super && ((@turn_score < 20) || (@score >= 100)) 
	end
end

class Hold20Play2 < Player
	def roll_again?
		super && @turn_score < 20
	end
end

## if player's total score is 78 don't stop at 98...go one more for the win!
class StrategicPlay1 < Player
	def roll_again?
		super && ((@score >= 78 && @turn_score < 22) || @turn_score < 20)
	end
end

class StrategicPlay2 < Player
	def roll_again?
		super && ((@score >= 78 && @turn_score < (100 - @score)) || @turn_score < 20)
	end
end

class LuckySeven < Player
	def roll_again?
		count = 0
		while count < 8
		  super && count
			count =+ 1
		end
	end
end
