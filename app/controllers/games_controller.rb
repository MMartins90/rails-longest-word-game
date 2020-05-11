class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    if check_word(attempt) && check_grid(attempt, grid)
      result[:score] = (attempt.length / result[:time] * 100).round
      result[:message] = "Well done! That word is both in the grid and our dictionary"
    elsif check_word(attempt) && !check_grid(attempt, grid)
      # The !check_grid(attempt, grid) in line above is the same as check_grid(attempt, grid) == false
      result[:score] = 0
      result[:message] = "Your word is valid but not in the grid, sorry!"
    elsif !check_word(attempt) && check_grid(attempt, grid)
      # note the !check_word(attempt)above also
      result[:score] = 0
      result[:message] = "Your word is in the grid but is not an english word, sorry!"
    end
    return result
  end
  end

end
