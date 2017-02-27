class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	
	def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  ActionMailer::Base.mail(:from => @email,
	    :to => 'ellenlovar@yahoo.com',
	    :subject => "A new contact form message from #{@name}",
	    :body => @message).deliver_now
	end

	rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
	end

end
