class ClinetsController < ApplicationController
	def new
		@Client = Client.new
	end
	
	def index
		if params[:status] == "activated"
			@Clients = Client.activated
		else
			@Clients = Client.unactivated
		end
	end
	
	der create
		@Clients = Client.new(params[:client])
		if @Client.save
			redirect_to @client
		else
			flash.now[:error] = "Sorry, Could not save clien"
			render :action = "new"
		end
	end
end
