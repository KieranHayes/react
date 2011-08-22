class PasswordResetMailer < ActionMailer::Base
  default :from => configatron.email

  def reset(user)
    @user = user
    mail(:to => @user.email,
         :subject => t("txt.password_reset_mailer.instructions"))
  end
end
