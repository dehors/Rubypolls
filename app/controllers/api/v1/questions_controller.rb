class Api::V1::QuestionsController < ApplicationController
	before_action :authenticate , only: [:create, :update, :destroy]
	before_action :set_questions, only: [:show, :update, :delete]
	before_action :set_poll
	before_action(only: [:update, :destroy, :create]) { |controlador| controlador.authenticate_owner(@poll.user) }
	def index		
		@questions = @poll.questions
	end
	def show
		
	end
	def create
		@question = @poll.questions.new(questions_params)
		if @question.save
			render template:"api/v1/questions/show"
		else
			render json: { error: @question.errors }, status: :unprocessable_entity
		end
	end
	def update
		
	end
	def delete
		
	end

	private

	def set_poll
		@poll = MyPoll.find(params[:poll_id])
	end	
	def questions_params
		params.require(:question).permit(:description)
	end
	def set_questions
		@questions = Questions.find(params[:id])
	end
end