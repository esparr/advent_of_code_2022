#1_calorie_counting.rb

class ElfFoodManagement
  def output
    puts "Nutrition points carried by top elf: " + biggest_bagged_elf.to_s
    puts "Nutrition points carried by top 3 elves: " + top_3_biggest_bagged_elves.to_s
  end

private

  def file
    File.open('inputs.txt')
  end

  def biggest_bagged_elf
    calories_per_elf.max 
  end

  def top_3_biggest_bagged_elves
    calories_per_elf.sort.reverse.slice(0, 3).sum
  end

  def calories_per_elf
    @elf_calories = []
    @elves_calories_list = []

    file.readlines.each do |line|
      line = line.chomp
      @elf_calories.push(line.to_i) unless line.nil? || line.empty?
      new_elf if line.empty?
      @elf_calories if line.nil?
    end
    file.close
    elves_calories_totals(@elves_calories_list)
  end

  def new_elf
    @elves_calories_list.push(@elf_calories)
    @elf_calories = []
  end

  def elves_calories_totals(elves_data)
    elves_total = []
    elves_data.each do |elf|
      elves_total.push(elf.sum)
    end
    elves_total
  end
end

nutrition = ElfFoodManagement.new
nutrition.output

