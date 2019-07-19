class Animal

  attr_accessor :legs, :diet

  def intialize(legs:, diet:)
    @legs = legs || 4
    @diet = diet || 'plants'
  end

  def x
    y = 10
  end

  def y
    x = 20
  end

  def a
    b != 12
  end

  def _b
    a == 1
  end

  def array_of_stuff
    array = [["banana", "apple"],["pineapple","beer"]]
    array.collect { |sub_array| sub_array.collect { |subsub_array| subsub_array.reverse }}
  end

  def speech
    input = "french"
    puts "English, ***, do you speak it?" and return if input == "english"
    puts "Baguette!" and return if input == "french"
    puts "I only smoke when it's free" and return if input == "dutch"
    puts "Dunno" # default
  end

  def my_brain_hurts_so_much
    if 1 != 0
      if 'a' != 'b'
        'hello' if 'b'.length == 1
        'goodbye'
      elsif 'b' != 'c'
        'goodbye' if 'c'.length > 0
        'hello'
      else 'goodbye'
    end
  end



end
