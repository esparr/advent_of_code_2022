# frozen_string_literal: true

require '../helpers/file_helper'
# The Rucksack Reorganization class returns type sum of the rucksacks
class CampCleanup
  def initialize
    @file_helper = FileHelper.new
  end

  def results
    puts "Total assignment pairs with one range fully containing the other: #{pair_sum}"
  end

  private

  def file
    File.open('input.txt')
  end

  def pair_sum; end
end

cleanup = CampCleanup.new
cleanup.results
