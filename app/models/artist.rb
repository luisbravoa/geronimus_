class Artist < ActiveRecord::Base
	has_many :songs
	has_many :albums
	belongs_to :user
end
