=begin
五十三という数値の表現がある。
これを53とするkanji_numberメソッドを定義する。

四    →4
十二  →12
五十三→53
七十  →70
=end

def kanji_number(k_num)
  @result = 0
  @num_over_save = 0
  kanji = k_num.chars
  numbers = {'一' => 1,'二' => 2,'三' => 3,'四' => 4,'五' => 5,
    '六' => 6,'七' => 7,'八' => 8,'九' => 9}
  numbers_over = {'十' => 10,'百' => 100,'千' => 1000,'万' => 10000}
  
  kl = kanji.size - 1
  kl.downto(0) {|i|
    k = kanji[i]
    ku = kanji[i + 1]
    @num_over = 0
    @result += numbers_over[ku] if numbers_over.key?(ku) && numbers_over.key?(k)
    next @num_over_save += numbers_over[ku] * numbers[k] if numbers_over.key?(ku) && numbers.key?(k)
    next @num_over = numbers_over[k] if numbers_over.key?(k)
    @result = numbers[k]
  }
  @result += @num_over + @num_over_save
end

require 'minitest/autorun'
class KanjiNUmberTest < Minitest::Test
  def test_kanji_number_4
    assert_equal 4,kanji_number('四')
  end
  def test_kanji_number_12
    assert_equal 12,kanji_number('十二')
  end
  def test_kanji_number_53
    assert_equal 53,kanji_number('五十三')
  end
  def test_kanji_number_70
    assert_equal 70,kanji_number('七十')
  end
  def test_kanji_number_100
    assert_equal 100,kanji_number('百')
  end
  def test_kanji_number_285
    assert_equal 285,kanji_number('二百八十五')
  end
  def test_kanji_number_9872
    assert_equal 9872,kanji_number('九千八百七十二')
  end
  def test_kanji_number_53875
    assert_equal 53875,kanji_number('五万三千八百七十五')
  end
end