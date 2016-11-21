module Kms
  module Feedback
    class FeedbackMessagesController < Kms::ApplicationController

      load_and_authorize_resource class: "Kms::FeedbackMessage"

      def index
        render json: Kms::FeedbackMessage.order('created_at desc').to_json
      end


      def destroy
        @feedback = Kms::FeedbackMessage.find(params[:id])
        @feedback.destroy
        render json: @feedback.to_json
      end

    end
  end
end
