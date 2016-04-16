class Api::V1::MyPollsController < ApplicationController
	def index
		@polls = MyPoll.all
	end
	def create
		@poll = MyPoll.find(params[:id])
	end
	def update
		
	end
	def destroy
		
	end 
end