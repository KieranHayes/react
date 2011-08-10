class NoRecipientsError < StandardError; end

class NotificationMailer < ActionMailer::Base
  layout "mailer"
  default :from => configatron.email

  include ApplicationHelper

  def feature_updated(feature)
    @feature = feature
    @as_a_or_an = as_a_or_an(@feature.actor.name)
    member = feature.project.memberships.for_user(feature.updated_by).first
    recipient_members = feature.project.memberships.select do |m|
       (m.client? && member.developer?) || (m.developer? && member.client?)
    end
    raise NoRecipientsError.new if recipient_members.empty?
    recipients = recipient_members.collect{|m| m.user.email}
    mail(:to => recipients,
         :subject => "[#{feature.project.name}] feature ##{feature.project_feature_id} \"#{feature.title}\" updated by #{feature.updated_by.name}") do |format|
          format.html
          format.text
         end
  end

  def feature_signed_by_client(feature)
    @feature = feature
    recipients = feature.project.memberships.select{|m| m.developer?}.collect{|m| m.user.email}
    mail(:to => recipients,
         :subject => "[#{feature.project.name}] feature ##{feature.project_feature_id} \"#{feature.title}\" signed by client #{feature.client_signature.user.name}")
  end
end
