Rails.application.routes.draw do
  get 'admin/index'

  get 'admins/index'

  devise_for :users
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

