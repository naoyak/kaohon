class User < ActiveRecord::Base
	has_secure_password
	has_many :posts

	

	validates :name, presence: true
	validates :username, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true

end
