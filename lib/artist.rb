require "pry"

class Artist
  
  attr_accessor :name, :songs
  attr_reader :add_song
  
  @@all = []
  
  def initialize(name)
    @name = name      # this artist name
    @@all << self     # all artists
    @songs = []       # all songs by this artist
  end
  
  def self.all
    @@all
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    self.songs << song
  end
  
  def self.find_or_create_by_name(name)
    if self.all.detect { |artist| artist.name == name }
      self.all.detect { |artist| artist.name == name }
    else
      found = self.new(name) 
      found
    end
  end

  def print_songs
    self.songs.each do |song| 
      puts song.name
    end
  end

end