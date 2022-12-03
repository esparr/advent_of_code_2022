# frozen_string_literal: true

# The Rock Paper Scissors class returns total score for elf cheat sheet.
class RockPaperScissors
  TIE_POINT_KEY = [
    { match: %w[A X], score: 1 },
    { match: %w[B Y], score: 2 },
    { match: %w[C Z], score: 3 }
  ].freeze

  POINT_KEY = [
    { match: %w[A Z], w_score: 1, winner: 'A', l_score: 3, loser: 'Z' },
    { match: %w[C X], w_score: 1, winner: 'X', l_score: 3, loser: 'C' },
    { match: %w[B X], w_score: 2, winner: 'B', l_score: 1, loser: 'X' },
    { match: %w[A Y], w_score: 2, winner: 'Y', l_score: 1, loser: 'A' },
    { match: %w[C Y], w_score: 3, winner: 'C', l_score: 2, loser: 'Y' },
    { match: %w[B Z], w_score: 3, winner: 'Z', l_score: 2, loser: 'B' }
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

  def match_scores
    @match_scores = []
    @match_data.each do |_match|
      score = 0
      score = score + 3 + obj_score if tie
      score = score + 6 + obj_score if winner
      score += obj_score if !tie && !winner
      match_scores.push(score)
    end
    @match_scores
  end

  def obj_score
    POINT_KEY.find { |h| break h[:w_score] if h[:match] == match } if winner
    TIE_POINT_KEY.find { |h| break h[:score] if h[:match] == match } if tie
    POINT_KEY.find { |h| break h[:l_score] if h[:match] == match } unless !winner && !tie
  end

  def tie
    TIE_POINT_KEY.find { |h| break h[:score] if h[:match] == match }
  end

  def winner
    %w[X Y Z].include?(POINT_KEY.find { |h| break h[:winner] if h[:match] == match }.to_s)
  end

  def total_score
    @match_scores.sum
  end
end

game_run = RockPaperScissors.new
game_run.results
