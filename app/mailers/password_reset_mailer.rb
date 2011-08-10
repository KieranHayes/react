class PasswordResetMailer < ActionMailer::Base
  default :from => configatron.email

  def reset(user)
    @user = user
    mail(:to => @user.email,
         :subject => "REACT Password Reset Instructions")
  end
end
