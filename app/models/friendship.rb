class Friendship < ActiveRecord::Base
	belongs_to :friender, class_name: "User"
	belongs_to :friended, class_name: "User"
end
