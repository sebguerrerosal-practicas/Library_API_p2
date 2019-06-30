Rails.application.routes.draw do
  get 'helloworld', to: 'welcome#index'
  namespace :admin do
    resources :authors, only: [:create,:show]
    end
    resources :authors do
        resources :books
    end
    
    
end
