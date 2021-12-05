Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments do
      resources :likes
    end
    resources :likes
    get :total_data, on: :collection
  end
end
