class ElfFoodManagement

  def total_nutrition_points_for_elf_with_biggest_bag(file)
    elves_total = calories_per_elf(file)
    bulky_bagged_elf_total_calories = elves_total.max
  end

  def total_nutrition_points_top_three_elves_with_biggest_bags(file)
    calories_per_elf(file).sort.reverse.slice(0, 3).sum
  end

private

  def file
    file = File.open("star_1/inputs.txt")
  end

  def calories_per_elf(file)
    elf_calories = []
    elves_calories_list = []

    file.readlines.each do |line|
      line = line.chomp
      if line != ''
        elf_calories.push(line.to_i)
      elsif line == ''
        elves_calories_list.push(elf_calories)
        elf_calories = []
      else
        elf_calories
      end

      elf_calories
    end

    elves_calories_totals(elves_calories_list)
  end

  def elves_calories_totals(elves_data)
    elves_total = []
    elves_data.each do |elf|
      elves_total.push(elf.sum)
    end

    elves_total
  end
end