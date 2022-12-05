# frozen_string_literal: true

# The Rock Paper Scissors class returns total score for elf cheat sheet.
class RockPaperScissors
  TIE_POINT_KEY = [
    { match: %w[A X], points: 1 },
    { match: %w[B Y], points: 2 },
    { match: %w[C Z], points: 3 }
  ].freeze

  POINT_KEY = [
    { match: %w[A Z], w_points: 1, winner: 'A', l_points: 3, loser: 'Z' },
    { match: %w[C X], w_points: 1, winner: 'X', l_points: 3, loser: 'C' },
    { match: %w[B X], w_points: 2, winner: 'B', l_points: 1, loser: 'X' },
    { match: %w[A Y], w_points: 2, winner: 'Y', l_points: 1, loser: 'A' },
    { match: %w[C Y], w_points: 3, winner: 'C', l_points: 2, loser: 'Y' },
    { match: %w[B Z], w_points: 3, winner: 'Z', l_points: 2, loser: 'B' }
  ].freeze

  def results
    puts "my total score: #{total_score}"
  end

  private

  def file
    File.open('inputs.txt')
  end

  def match_data
    @match_data = []
    file.readlines.each do |line|
      line = line.chomp
      next if line.nil? || line.empty?

      @match_data.push(line.split)
    end
    @match_data
  end

  def match_points
    @match_points = []
    @match_data.each do |_match|
      points = 0
      points += obj_points
      points += 3 if tie
      points += 6 if winner
      match_points.push(points)
    end
    @match_points
  end

  def obj_points
    winner_points if winner
    tie_points if tie
    loser_points unless !winner && !tie
  end

  def winner_points
    POINT_KEY.find { |h| break h[:w_points] if h[:match] == match }
  end

  def tie_points
    TIE_POINT_KEY.find { |h| break h[:points] if h[:match] == match }
  end

  def loser_points
    POINT_KEY.find { |h| break h[:l_points] if h[:match] == match }
  end

  def tie
    TIE_POINT_KEY.find { |h| break h[:points] if h[:match] == match }
  end

  def winner
    %w[X Y Z].include?(POINT_KEY.find { |h| break h[:winner] if h[:match] == match }.to_s)
  end

  def total_score
    @match_points.sum
  end
end

game_run = RockPaperScissors.new
game_run.results
