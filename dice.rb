class DiceSyori
  def left_right
    puts '何個振る？'
    @left = gets.to_i
    while @left <= 0
      puts '1以上の数値を入れてください'
      puts '何個振る？'
      @left = gets.to_i
    end
    puts '何面ダイスを振る？'
    @right = gets.to_i
    while @right <= 0
      puts '1以上の数値を入れてください'
      puts '何面ダイスを振る？'
      @right = gets.to_i
    end
  end

  def leftD
    @dice = []
    @left.times do
      @dice.push(rightD)
    end
  end

  def rightD
    rand(@right) + 1
  end

  def hyouji
    puts "#{@left} D #{@right}"
    p @dice
    @d=0
    @dice.each do|i|
      @d=@d+i
    end
    puts @d
  end
end

d = DiceSyori.new
d.left_right
d.leftD
d.rightD
d.hyouji