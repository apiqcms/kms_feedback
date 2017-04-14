module Kms
  class CaptchaVerifier
    include ::Recaptcha::Verify

    def initialize(model, params)
      @model = model
      @params = params
    end

    def verify
      if Kms::Settings.instance.values['enable_recaptcha']
        verify_recaptcha(model: @model, private_key: Kms::Settings.instance.values['recaptcha_private_key'])
      elsif Kms::Settings.instance.values['enable_invisible_captcha'] && @params[:captcha].present?
        @model.errors.add(:base, 'spam detected') && false
      else
        true
      end
    end
  end
end
