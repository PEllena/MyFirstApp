class UserMailer < ApplicationMailer
	default from: "ellenlovar@yahoo.com"

  def contact_form(email, name, message)
  	@message = message
    mail(:from => email,
        :to => 'ellenlovar@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome_email(user)
    @user = user
    @url  = "http://morisart.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to MORISART!")
  end
end
