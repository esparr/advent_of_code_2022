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

  POINT_KEY_2 = {
    'A Z': 8,
    'A X': 3,
    'C X': 2,
    'B X': 1,
    'B Y': 5,
    'A Y': 4,
    'C Y': 6,
    'C Z': 7,
    'B Z': 9
  }.freeze

  def results
    puts "my total score: #{match_points(POINT_KEY)}"
    puts "my total score with new info: #{match_points(POINT_KEY_2)}"
  end

  private

  def file
    File.open('input.txt')
  end

  def match_points(point_key)
    @match_data = []
    file.readlines.each do |line|
      line = line.chomp
      next if line.nil? || line.empty?

      points = point_key.fetch(line.to_sym)
      @match_data.push(points)
    end
    file.close
    @match_data.sum
  end
end

game_run = RockPaperScissors.new
game_run.results
