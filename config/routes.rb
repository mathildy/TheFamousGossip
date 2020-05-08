Rails.application.routes.draw do
    resources :gossip
    resources :user
    resources :city
    resources :comment 
    resources :sessions, only: [:new, :create, :destroy]
    resources :like, only: [:show, :create, :destroy]
  

    # --- routes for about_us_controller ---
    get '/contact', to: 'about_us#contact'
    get '/team', to: 'about_us#team'    

    root 'gossip#index'
end

