class Api::V1::MyPollsController < Api::V1::MasterApiController
	before_action :authenticate , only: [:create, :update, :destroy]
	before_action :set_poll, only: [:show, :update, :destroy]
	before_action(only: [:update, :destroy]) { |controlador| controlador.authenticate_owner(@poll.user) }

	# api/v1/polls
	def index
		@polls = MyPoll.all
	end
	# api/v1/polls/:id
	def show
		
	end
	def create
		#@poll = @current_user.my_polls.new(my_polls_params)
		@poll = MyPoll.new(my_polls_params)
		@poll.user = @current_user
		if @poll.save
			render template: "api/v1/my_polls/show"
		else
			render json: {errors: @poll.errors.full_messages}, status: :unprocessable_entity
	    end
	end
	def update
		
		@poll.update(my_polls_params)
		render "api/v1/my_polls/show"		
		
	end
	def destroy
		
		@poll.destroy
		render json: { message: "Se ha eliminado" }
		
	end 

	private	

	def my_polls_params
		params.require(:poll).permit(:title, :description, :expires_at)	
	end
	def set_poll
		@poll = MyPoll.find(params[:id])
	end
end