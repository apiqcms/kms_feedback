module Kms
  class FeedbackMessage < ActiveRecord::Base
    after_create :send_alert
    attr_accessor :captcha

    def send_alert
      Kms::User.alertable.each do |user|
        FeedbackMailer.send_alert(user, self).deliver
      end
    end
  end
end
