Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # post 'posts/create'
  # get 'posts/edit'
  # post 'posts/update'
  # delete 'posts/destroy'
  #   patch 'posts/share'

  devise_for :users
  delete 'logout' => 'sessions#destroy'
  resources :posts do 
    patch :share
  end
  get 'tags/:tag', to: 'posts#index', as: "tag"
 
  root to: 'homes#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
