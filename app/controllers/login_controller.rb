class LoginController < ApplicationController
	skip_before_filter :requier_login, :only => [:new, :craete]
	
	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:current_user_id] = user.id
			redirect_to_root_url
		end
	end
	
	def destroy
		//@_current_user = session[:current_user_id] = nil
		session[:current_user_id] = nil
		flash[:notice] =" Yout Have successfuclly logged out"
		redirect_to root_url
	end
