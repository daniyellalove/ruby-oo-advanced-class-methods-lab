class Song
  attr_accessor :name, :artist_name
  @@all = [] 

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song| 
        song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end

  def self.new_from_filename(filename)
    new_filename = filename.split(/ - |....\z/)
    new_song_name = Song.new_by_name(new_filename[1])
    new_song_name.artist_name = new_filename[0]
    new_song_name
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
