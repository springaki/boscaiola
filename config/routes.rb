Rails.application.routes.draw do

  resources :posts
  root to: redirect('/home')

  get 'home', to: 'home#show'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
