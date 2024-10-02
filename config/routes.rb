Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Rswag::Ui::Engine => 'api-docs'
  mount Rswag::Api::Engine => 'api-docs'
  
  namespace :api , format: 'json'do
    namespace :v1 do
      resources :todos, only: [:index]
    end
    resources :quizs, param: :quiz_num, only: [:show]
    resources :rankings, only: [:show, :create] do
      collection do
        post ':user_name/:score', action: :create
      end
    end
  end
end
