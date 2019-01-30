require "pry"
class Song

  attr_accessor :name, :artist, :genre, :count, :artists

  @@album = []
  @@count = 0
  @@artists = []
  @@genres = []

  def initialize( name, artist, genre )
    @name = name
    @artist = artist
    @genre = genre
    
    @@album << self
    @@count += 1

    @@artists << artist
    @@genres << genre
    # binding.pry
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    self.count_repeats(@@genres)
  end

  def self.artist_count
    self.count_repeats(@@artists)
  end

  def self.count_repeats(class_variable)
    repeats = class_variable.uniq

    counting_hash = {}

    repeats.each do |unique|
      counting_hash[unique] = class_variable.count(unique)
    end

    counting_hash
  end


end