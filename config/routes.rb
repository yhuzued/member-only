Rails.application.routes.draw do
  resources :posts
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
    
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # the root isnt going anywhere
  root "posts#index"
end
