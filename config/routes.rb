Rails.application.routes.draw do
  devise_for :users
  resources :categories do
	  resources :forums do
	    resources :topics do
		  resources :replies
		end
	  end		
  end
  
  root 'categories#index'
end

