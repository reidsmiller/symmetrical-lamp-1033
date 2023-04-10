Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customers/:customer_id', to: 'customers#show'
  patch '/customers/:customer_id', to: 'customers#update'

  get '/items', to: 'items#index'
end
