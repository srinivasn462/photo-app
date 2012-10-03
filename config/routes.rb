PhotoApp::Application.routes.draw do

  resources :photos do
    resources :comments
  end

  devise_for :users

  get "home/index"

  root :to => 'home#index'
end
