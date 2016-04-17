class Api::V1::MyPollsController < ApplicationController
	before_action :authenticate , only: [:create, :update, :destroy]
	before_action :set_poll, only: [:show, :update, :destroy]

	def index
		@polls = MyPoll.all
	end
	def show
		
	end
	def create
		@poll = @current_user.my_polls.new(my_polls_params)
		if @poll.save
			render "api/v1/my_polls/show"
		else
			render json: {errors: @polls.errors.full_message}, status: :unprocessable_entity
	    end
	end
	def update
		if authenticate_owner(@poll.user)
			@poll.update(my_polls_params)
			render "api/v1/my_polls/show"		
		end
	end
	def destroy
		if authenticate_owner(@poll.user)
			@poll.destroy
			render json: { message: "Se ha eliminado" }
		end	
	end 

	private

	def authenticate_owner(user)
		if owner !=@current_user
			render json: { errors: "No tiene autorizado eliminar esa encuesta" }, status: 401
			return false
		end
		true		
	end

	def my_polls_params
		params.require(:poll).permit(:title, :description, :expires_at)	
	end
	def set_poll
		@poll = MyPoll.find(params[:id])
	end
end