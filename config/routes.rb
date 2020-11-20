Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :jobs >> Adds the seven routes [index, show, new, create, edit, update, destroy]
  resources :jobs do
  # resources :applications >> is nested into jobs and just adds [new, create]
    resources :job_applications, only: [:new, :create, :edit, :update]
  end

  resources :job_applications, only: [:destroy]
end
