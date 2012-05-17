class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  /* or
  before_filter do |controller|
	redirect_to new_login_url unless controller.send(logged_in?)
  */
   
  private
  
  def require_login
	unless logged_in?
		flash[:error] => "You must loged in to accessed this section!"
		redirect_to new_login_url
  end
  
  def logged_in?
	!!current_user
  end
  
  def default_url_options(options)
	{:locale => I18n.locale}
  end
  
  def current_user
	@_current_user ||= session[:current_user_id] &&
		User.find_by_id(session[:current_user_id])
  end
end

/* or
 class ApplictionController < ActionController::Base
	before_filter LoginFilter
  end
  
  class LoginFilter
		def self.filter(controller)
			unless controller.send(:logged_in?)
				controller.flash[:error] = "You must be logged in"
				controller.redirect_to controller.new_login_url
			end	
		end
	end
  */
