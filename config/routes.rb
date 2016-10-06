Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :update, :show, :edit] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :destroy, :update, :show, :edit] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
