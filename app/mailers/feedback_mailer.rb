class FeedbackMailer < ActionMailer::Base
  default from: Proc.new { Kms::Settings.instance.values['feedback_from_email'] } #"no-reply@email.webgradus.com"

  def send_alert user, feedback
    #TODO Add site domain
    @feedback = feedback
    mail(to: user.email, subject: I18n.t(:new_feedback_from_site, scope: :feedback_mailer))
  end
end
