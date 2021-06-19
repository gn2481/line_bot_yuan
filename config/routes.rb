Rails.application.routes.draw do

  root "items#index"

  resources :line_bot_yuan do
    collection do
      post :webhook
    end
  end

  resources :items
end
