class InvitationMailer < ActionMailer::Base
  default :from => configatron.email

  def invitation(invitation)
    @invitation = invitation
    mail(:to => @invitation.email,
         :subject => t("txt.invitation_mailer.invitation_subject", :project_name => @invitation.project.name))
  end
end
