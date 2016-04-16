class Api::V1::UsersController < ApplicationController

	# POST/users
	def create
		@current_user
		if !params[:auth]
		render json: { error: "Auht param is missing"}
		else
			@user = User.from_omniauth(params[:auth])
			@token = @user.tokens.create()
			render "api/v1/users/show"
		end
	end

end