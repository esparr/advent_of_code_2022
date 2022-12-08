# frozen_string_literal: true

# The File Helper class defines file functions needed across folders
class FileHelper
  def initialize; end

  def read_file(file, line_break: false)
    @data = []

    file.readlines.each do |line|
      readlines_nested(line) unless line_break == false
      readline_no_breaks(line) if line_break == false

      file.close
    end

    @data
  end

  def readline_no_breaks(line)
    @data.push(line.chomp) unless line.nil? || line.empty?

    @data
  end

  def readlines_nested(line)
    @data_nested = []
    line = line.chomp
    @data.push(line.to_i) unless line.nil? || line.empty?
    new_data if line.empty?
    @data if line.nil?

    @data = @data_nested
  end

  def new_data
    @data_nested.push(@data)
    @data = []
  end
end
