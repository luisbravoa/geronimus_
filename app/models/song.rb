class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  belongs_to :album

end
