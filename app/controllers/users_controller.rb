class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end

	def create
		user = User.new()
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		
	end

	def destroy
	end

	private


end
