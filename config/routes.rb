Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Rswag::Ui::Engine => 'api-docs'
  mount Rswag::Api::Engine => 'api-docs'
    
  namespace :v1 do
    resources :todos, only: [:index]
  end
  resources :quizs, only: [:show]
  resources :lowquizs, only: [:show]
  resources :middlequizs, only: [:show]
  resources :rankings, only: [:index, :create] do
    collection do
      post ':user_name/:score', action: :create
    end
  end
end
