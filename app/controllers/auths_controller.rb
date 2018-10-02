class AuthsController < ApplicationController

	def create
		render json: {msg: "ok"}
	end
end
