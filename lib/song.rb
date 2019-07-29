require "pry"

class Song
  attr_accessor :name
  attr_reader :artist_name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.songs << self unless self.artist.songs.include?(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def self.new_by_filename(filename)
    song = Song.new(filename.split(" - ")[1]) 
    song.artist_name = filename.split(" - ")[0]
    song
  end
  
end