module Kms
  module Public
    class FeedbackMessagesController < ActionController::Base
      protect_from_forgery with: :exception

      def create
        @feedback = Kms::FeedbackMessage.new(feedback_params)
        Kms::CaptchaVerifier.new(@feedback, feedback_params).verify && @feedback.save
        if @feedback.errors.present?
          render json: @feedback.to_json(methods: :errors), status: :unprocessable_entity
        else
          render json: @feedback.to_json
        end
      end

      protected

      def feedback_params
        params.require(:feedback).permit(:name, :phone, :email, :message, :captcha)
      end
    end
  end
end
