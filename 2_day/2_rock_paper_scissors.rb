# frozen_string_literal: true

# The Rock Paper Scissors class returns total score for elf cheat sheet.
class RockPaperScissors
  POINT_KEY = {
    'A Z': 3,
    'A X': 4,
    'C X': 7,
    'B X': 1,
    'B Y': 5,
    'A Y': 8,
    'C Y': 2,
    'C Z': 6,
    'B Z': 9
  }.freeze

  def results
    puts "my total score: #{match_points}"
  end

  private

  def file
    File.open('input.txt')
  end

  def match_points
    @match_data = []
    file.readlines.each do |line|
      line = line.chomp
      next if line.nil? || line.empty?

      points = POINT_KEY.fetch(line.to_sym)
      @match_data.push(points)
    end
    file.close
    @match_data.sum
  end
end

game_run = RockPaperScissors.new
game_run.results
