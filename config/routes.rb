Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, :only => [:show, :index]
  resources :profiles
  resources :categories do
	  resources :forums do
	    resources :topics do
		  resources :replies
		end
	  end		
  end
  
  get 'admin/index', to: 'admin#index'

  root 'categories#index'
end

