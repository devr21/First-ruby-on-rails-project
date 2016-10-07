Rails.application.routes.draw do
  	get 'sessions/login' => 'sessions#login'
    get 'sessions/signup' => 'sessions#signup'
    post 'sessions/attempt' => 'sessions#attempt'
    get 'sessions/logout' => 'sessions#logout'
    resources :users  	
  	   resources :articles do
  		  resources :comments 
  	   end

	root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
