PhotoApp::Application.routes.draw do
  resources :photos

  devise_for :users

  get "home/index"

  root :to => 'home#index'
end
