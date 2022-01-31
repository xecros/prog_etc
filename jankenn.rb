class JankennSyori
  def you_hand
    puts "あなたの出す手を決めてね！"
    puts "0,グー 1,チョキ 2,パー"
    @you = gets.to_i
   until (0 <= @you && @you <= 2)
    puts '0,1,2のどれかを入力してください'
    puts "0,グー 1,チョキ 2,パー"
    @you = gets.to_i
   end
  end

  def com_hand
    @com = rand(3)
  end
  
  def hantei
    @h = @you - @com
    if @h > 0
      @h -= 3
    end
  end
  
  def hyouji
    hand={0 => 'グー',1 => 'チョキ',2 => 'パー'}
    hantei_hand={0 => 'あいこ',-1 => 'あなたの勝ち',-2 => 'COMの勝ち'}

    puts "あなたは#{hand[@you]}"
    puts "COMは#{hand[@com]}"
    puts hantei_hand[@h]
  end
end

j=JankennSyori.new
j.you_hand
j.com_hand
j.hantei
j.hyouji