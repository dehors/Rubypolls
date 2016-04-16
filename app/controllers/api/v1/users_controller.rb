class Api::V1::UsersController < ApplicationController

	# POST/users
	def create
		@user = User.from_omniauth(params[:auth])
		@token = @user.tokens.create()	
		render "api/v1/users/show"
	end

end