Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "votes#index"
  resources :votes do
    resources :comments, only: [ :create, :destroy ]
    collection do
      get :search, to: "votes#index"
      get :export
      post :send_csv
    end
  end
end
