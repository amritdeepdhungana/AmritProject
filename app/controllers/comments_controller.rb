class CommentsController < ApplicationController
	def new
		@comment = Comment.new(:name=> cookies[:commenter_name])
	end
	
	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			flash[:notice] = "Thanks for comment!!"
			if params[:remember_name]
				cookies[:commenter_name] = @comment.name
			else
				cookies.delete(:commenter_name)
			end
			redirect_to @comment.article
		else
			reder :action => "new"
		end
	end
end
