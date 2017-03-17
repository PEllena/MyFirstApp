Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#landing_page'
  
  post 'static_pages/thank_you'

  post 'payments/create'

  get 'payments/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
