class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  

  def self.create
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = Song.new
    s.name = name
    s.save
    s
  end
  
  def self.find_by_name(name)
    Song.all.find do |s|
      s.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s 
      s
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical 
    @@all.sort_by do |a|
      a.name
    end
  end
  
  def self.new_from_filename(filename)
    rows = filename.split(" - ")
    s = self.new
    s.artist_name = rows[0]
    s.name = rows[1].split(".mp3")[0]
    s
  end
  
  def self.create_from_filename(mp3_file)
    rows = mp3_file.split(" - ")
    s = self.new
    s.artist_name = rows[0]
    s.name = rows[1].split(".mp3")[0]
    @@all << s
  end
  

  def self.destroy_all
    @@all.clear
  end
  

  def save
    self.class.all << self
  end

end
