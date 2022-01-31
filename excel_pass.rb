require 'win32ole'

module Excel; end

class Excel_pass
  @path = 'C:\src\Ruby\Book1.xlsx'
  excel = WIN32OLE.new('Excel.Application')
  excel.visible = true
  def self.pass(num)
    book = excel.Workbooks.Open({filename: @path,Password: num})
  end
end

startT = Time.now

n = 0
begin
  Excel_pass.pass(n.to_s(36))
rescue
  n += 1
  retry
end

endT = Time.now - startT
puts "パスワードは#{n.to_s(36)}です。かかった時間は#{endT.to_i}秒です。"