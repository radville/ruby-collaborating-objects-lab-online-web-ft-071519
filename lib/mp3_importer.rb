require "pry"

class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.chdir(self.path)
    files = Dir.glob("*")
    Dir.chdir("/home/radville/ruby-collaborating-objects-lab-online-web-ft-071519")
    files
  end
  
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
  
  
end