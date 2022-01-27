class Calender
  require 'date'
  attr_accessor :year, :month
  def listen
    puts "いつのカレンダーを出しますか？"
    puts "何年？"
    @year = gets.to_i
    puts "何月？"
    @month = gets.to_i
  end

  def calender_disp
    d = Date.new(@year, @month)

    puts " #{@year}年 #{@month}月"
    puts " 日曜 月曜 火曜 水曜 木曜 金曜 土曜"
    print "     " * d.wday
    now_month = d.mon

    while d.mon == now_month
      printf("% 5d", d.mday)
      puts if d.wday == 6
      d += 1
    end
  end
end

cal = Calender.new
cal.listen
cal.calender_disp