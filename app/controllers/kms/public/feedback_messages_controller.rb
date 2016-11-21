module Kms
  module Public
    class FeedbackMessagesController < ActionController::Base
      def create
        @feedback = Kms::FeedbackMessage.new(feedback_params)
        if Kms::Settings.instance.values['enable_recaptcha']
          verify_recaptcha(model: @feedback, private_key: Kms::Settings.instance.values['recaptcha_private_key']) && @feedback.save
        else
          @feedback.save
        end
        if @feedback.errors.present?
          render json: @feedback.to_json(methods: :errors), status: :unprocessable_entity
        else
          render json: @feedback.to_json
        end
      end

      protected

      def feedback_params
        params.require(:feedback).permit(:name, :phone, :email, :message)
      end
    end
  end
end
