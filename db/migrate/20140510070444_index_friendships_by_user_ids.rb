class IndexFriendshipsByUserIds < ActiveRecord::Migration
  def change
  	add_index :friendships, [:friender_id, :friended_id]
  end
end
