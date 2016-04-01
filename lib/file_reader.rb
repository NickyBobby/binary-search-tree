require 'pry'

class FileReader

  def read(filename)
    File.read(filename).chomp
  end

end
