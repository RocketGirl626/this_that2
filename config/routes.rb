Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :questions do
    resources :comments
  end

  resources :questions do
    member do
      put "like" => "questions#upvote"
      put "unlike" => "questions#downvote"
    end
  end

end
