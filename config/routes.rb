Rails.application.routes.draw do
  get 'applications/new'
  get 'applications/create'
  get 'user/index'
  get 'user/show'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/jobs', to: 'jobs#index'
  get '/jobs/new', to: 'jobs#new'
  get '/jobs/:id', to: 'jobs#show'
  post '/jobs', to:'jobs#create'
  get '/jobs/:id/edit', to:'jobs#edit'
  patch '/jobs/:id', to:'jobs#update'
  delete '/jobs/:id', to:'jobs#destroy'

  get 'jobs/:id/applications/new', to: 'applications#new'
  post 'users/:id/applications', to: 'applications#create'
end
