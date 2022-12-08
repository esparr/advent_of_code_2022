# frozen_string_literal: true

require '../helpers/file_helper'
# The Rucksack Reorganization class returns type sum of the rucksacks
class RucksackReorganization
  PRIORITY_KEY = {
    'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5,
    'f': 6, 'g': 7, 'h': 8, 'i': 9, 'j': 10,
    'k': 11, 'l': 12, 'm': 13, 'n': 14, 'o': 15,
    'p': 16, 'q': 17, 'r': 18, 's': 19, 't': 20,
    'u': 21, 'v': 22, 'w': 23, 'x': 24, 'y': 25,
    'z': 26, 'A': 27, 'B': 28, 'C': 29, 'D': 30,
    'E': 31, 'F': 32, 'G': 33, 'H': 34, 'I': 35,
    'J': 36, 'K': 37, 'L': 38, 'M': 39, 'N': 40,
    'O': 41, 'P': 42, 'Q': 43, 'R': 44, 'S': 45,
    'T': 46, 'U': 47, 'V': 48, 'W': 49, 'X': 50,
    'Y': 51, 'Z': 52
  }.freeze

  def initialize
    @file_helper = FileHelper.new
  end

  def results
    puts "Sum of priorities of types: #{rucksack_sum}"
    puts "Sum of the priorities of badge types: #{rucksack_badge_sum}"
  end

  private

  def file
    File.open('input.txt')
  end

  def rucksack_sum
    misplaced_items = []
    rucksacks = @file_helper.read_file(file)
    rucksacks.each do |sack|
      first, second = sack.chars.each_slice(sack.length / 2).map(&:join)
      misplaced_item_priority = PRIORITY_KEY.fetch((first.chars & second.chars)[0].to_sym)
      misplaced_items.push(misplaced_item_priority)
    end
    misplaced_items.sum
  end
end

reorganize = RucksackReorganization.new
reorganize.results
