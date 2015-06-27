class User < ActiveRecord::Base
  has_secure_password

  has_many :songs
  has_many :artists
  has_many :albums

  validates :username, length: { :minimum =>  2}, uniqueness: true, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true, presence: true
  validates :first_name, length: {:minimum =>  2}




  def add_song(filename, metadata)

  	song = Song.new

  	song.file = filename

    if !metadata.title.nil? && metadata.title.length > 0
    	song.title = metadata.title
    end

    
    if !metadata.artist.nil? && metadata.artist.length > 0
    	artist = self.artists.find_by_name(metadata.artist)
    	if artist.nil?
    		artist = Artist.new
    		artist.name = metadata.artist
    		self.artists << artist
    		# artist.save
    	end 

    	song.artist = artist
    end
    if !metadata.album.nil? && metadata.album.length > 0
    	album = self.albums.find_by_name(metadata.album)
    	if album.nil?
    		album = Album.new
    		album.name = metadata.album
    		self.albums << album
    		# album.save
    	end
    	song.album = album 
    end


    self.songs << song

    return self.save

    # song.save


  end



end
