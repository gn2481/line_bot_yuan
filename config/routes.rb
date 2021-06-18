Rails.application.routes.draw do

  root "line_bot_yuan#index"

  resources :line_bot_yuan do
    collection do
      post :webhook
    end
  end
end
