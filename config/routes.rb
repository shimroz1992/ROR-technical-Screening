Rails.application.routes.draw do
  devise_for :users

  resources :libraries, only: [:index] do
    resources :books, only: [:index]
  end

  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
end
