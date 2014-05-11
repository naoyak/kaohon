class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			# sign user in...redirect to user.show
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'invalid!'
			render 'new'
		end


	end


	def destroy
		sign_out
		redirect_to signin_url
	end

end
