Rails.application.routes.draw do
  resources :listings do
    resources :photos, only: [:create, :destroy]
  end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :update, :edit, :show ] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end



  root 'listings#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  resources :listings, controller: "listings"
  # resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
