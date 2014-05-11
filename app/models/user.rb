class User < ActiveRecord::Base
	before_create :create_remember_token
	
	has_secure_password
	has_many :posts, dependent: :destroy
	has_many :friendships, foreign_key: "friender_id", dependent: :destroy 
	has_many :friends, through: :friendships, source: :friended



	

	validates :name, presence: true
	validates :username, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.digest(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	def friend(friended_user)
  		unless friends?(friended_user)
	  		self.friendships.create(friended_id: friended_user.id)
	  		friended_user.friendships.create(friended_id: self.id)
	  	end
  		# friendships.create(friender_id: friended_user.id, friended_id: self.id)
  	end

  	def friends?(friended_user)
  		self.friendships.find_by_friended_id(friended_user.id)
  	end

  	def unfriend(friended_user)
  		self.friendships.find_by_friended_id(friended_user.id).destroy
  		friended_user.friendships.find_by_friended_id(self.id).destroy
  	end

  	

  	private
  		def create_remember_token
      		self.remember_token = User.digest(User.new_remember_token)
    	end
end
