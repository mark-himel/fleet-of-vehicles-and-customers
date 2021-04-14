Rails.application.routes.draw do
  root 'vehicles#index'

  resources :vehicles, only: :index do
    collection do
      post :import
      get :export
    end
  end
end
