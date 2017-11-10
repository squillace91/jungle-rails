class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

   def welcome_email(user)
     @user = user.email
     @url  = 'http://example.com/login'
     mail(to: 'squillace91@gmail.com', subject: 'Welcome to My Awesome Site')
   end
end
