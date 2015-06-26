class User < ActiveRecord::Base
	has_secure_password

	has_many :songs

	validates :username, length: { :minimum =>  2}, uniqueness: true, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true, presence: true
	validates :first_name, length: {:minimum =>  2}

end
