class FriendshipsController < ApplicationController
	def create
		@friended_user = User.find(params[:friendship][:friended_id])
		current_user.friend(@friended_user)
		# @friended_user.friend(current_user)
		redirect_to @friended_user
	end

	def destroy
		@unfriended_user = User.find(params[:friendship][:friended_id])
		current_user.unfriend(@unfriended_user)
		redirect_to @unfriended_user
	end



	private
		def friendship_params
		  params.require(:friendship).permit(:friender_id, :friended_id)
		end

end
