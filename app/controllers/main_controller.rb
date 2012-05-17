class MainController < ApplicationController
	def index
		flash.keep
		redirect_to users_url
	end
end
