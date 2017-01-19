Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
  resources :jobs do
  		collection do
			get :it
			get :estate
			get :finance
			get :consumption
			get :manufacture
			get :chemistry
			get :bj
			get :sh
			get :sz
			get :gz
			get :hz
			get :search
		end
		resources :resumes
  end
  namespace :admin do
  	resources :jobs do
  		member do
  			post :publish
  			post :hide
		end
		collection do
			get :it
			get :estate
			get :finance
			get :consumption
			get :manufacture
			get :chemistry
			get :bj
			get :sh
			get :sz
			get :gz
			get :hz
		end
		resources :resumes
  	end
  	namespace :bj do
  		resources :jobs do
  			member do
	  			post :publish
	  			post :hide
  			end
  		end
  	end

  	namespace :sh do
  		resources :jobs do
  			member do
	  			post :publish
	  			post :hide
  			end
  		end
  	end

  	namespace :sz do
  		resources :jobs do
  			member do
	  			post :publish
	  			post :hide
  			end
  		end
  	end

  	namespace :gz do
  		resources :jobs do
  			member do
	  			post :publish
	  			post :hide
  			end
  		end
  	end

  	namespace :hz do
  		resources :jobs do
  			member do
	  			post :publish
	  			post :hide
  			end
  		end
  	end
  end
  resources :bj
  resources :sh
  resources :sz
  resources :gz
  resources :hz
end
