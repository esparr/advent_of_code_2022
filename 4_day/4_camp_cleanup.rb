# frozen_string_literal: true

require '../helpers/file_helper'
# The Rucksack Reorganization class returns type sum of the rucksacks
class CampCleanup
  def initialize
    @file_helper = FileHelper.new
  end

  def results
    puts "Sum of priorities of types: #{rucksack_sum}"
    puts "Sum of priorities of badge types: #{rucksack_badge_sum}"
  end

  private

  def file
    File.open('input.txt')
  end
end

cleanup = CampCleanup.new
cleanup.results
