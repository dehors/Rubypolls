class Api::V1::QuestionsController < ApplicationController
	before_action :authenticate , only: [:create, :update, :destroy]
	before_action :set_questions, only: [:show, :update, :delete]
	def index
		
	end
	def show
		
	end
	def create
		
	end
	def update
		
	end
	def delete
		
	end

	private
	
	def questions_params
		
	end
	def set_questions
		@questions = Questions.find(params[:id])
	end
end