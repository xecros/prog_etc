class Rename
  
  #複数回使用するためメソッド化
  def dirname_ex(name)
    File.dirname(name)
  end
  
  def name_ex(name,ext)
    File.basename(name, ".#{ ext }")
  end
  
  def rename_format(name)
    File.rename(name, "#{ format('%04d', @num) }.jpg")
  end

  #pngだと変換の際に順番がずれるのでここでjpgにリネーム
  def change_extension
    Dir.glob("*.png") do |name|
      File.rename(name, "#{ name_ex(name, 'png') }.jpg")
    end
    Dir.glob("*/*.png") do |name|
      File.rename(name, "#{dirname_ex(name)}/#{name_ex(name, 'png')}.jpg")
    end
  end

  #ファイル名の最初が1~9だと1が10の後に,2が20の後に回される為
  #条件にあった場合最初に0をつける
  def change_namehead
    Dir.glob("*.jpg") do |name|
      if name =~ /^[1-9]-/
        File.rename(name, "0#{name_ex(name, 'jpg')}.jpg")
      end
    end
    Dir.glob("*/*.jpg") do |name|
      if name_ex(name, 'jpg') =~ /^[1-9]-/
        File.rename(name, "#{dirname_ex(name)}/0#{name_ex(name, 'jpg')}.jpg")
      end
    end
  end

  def rename_exe
    @num = 0
    Dir.glob("*.jpg") do |name|
      rename_format(name)
      @num += 1
    end
    Dir.glob("*/*.jpg") do |name|
      rename_format(name)
      @num += 1
    end
  end

end

rn = Rename.new
rn.change_extension
rn.change_namehead
rn.rename_exe