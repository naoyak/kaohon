class Post < ActiveRecord::Base
	belongs_to :user, class_name: "User"
end
