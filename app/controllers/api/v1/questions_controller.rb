class Api::V1::QuestionsController < Api::V1::MasterApiController
	before_action :authenticate , only: [:create, :update, :destroy]
	before_action :set_questions, only: [:show, :update, :delete]
	before_action :set_poll
	before_action(only: [:update, :destroy, :create]) { |controlador| controlador.authenticate_owner(@poll.user) }
	
	# api/v1/polls/:id/questions"
	def index		
		@questions = @poll.questions
	end
	# api/v1/polls/:id/questions/:id"
	def show
		
	end
	def create
		@question = @poll.questions.new(questions_params)
		if @question.save
			render template: "api/v1/questions/show"
		else
			render json: { error: @question.errors }, status: :unprocessable_entity
		end
	end
	def update
		if @question.update(questions_params)
			render template: "api/v1/questions/show"
		else
			render json: { error: @question.errors }, status: :unprocessable_entity
		end
	end
	def destroy
		@question.destroy
		render json: { message: "Se ha eliminado" }
	end

	private

	def set_poll
		@poll = MyPoll.find(params[:poll_id])
	end	
	def questions_params
		params.require(:question).permit(:description)
	end
	def set_questions
		@question = Question.find(params[:id])
	end
end