Kms::Feedback::Engine.routes.draw do
  constraints(format: "json") do
    resources :feedback_messages, path: 'feedbacks', only: [:index, :destroy], format: true
  end
end
Kms::Engine.routes.draw do
  post '/users/alertable' => 'users#alertable'
end
Rails.application.routes.draw do
  resources :feedback_messages, path: 'feedbacks', only: :create, controller: 'kms/public/feedback_messages'
end
