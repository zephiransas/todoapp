Rails.application.routes.draw do
  root to: redirect('/todos')
  resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
