Rails.application.routes.draw do

  	devise_for :users, controllers: {
  		sessions: 'users/sessions',
  		passwords: 'users/passwords',
  		registrations: 'users/registrations'
  	}

  	devise_for :admins, controllers: {
  		sessions: 'admins/sessions',
  		passwords: 'admins/passwords',
  		registrations: 'admins/registrations'
  	}

  	namespace :admin do
  		resources :users
  		resources :reviews, only: [:index, :destroy]
  	end

	root 'cds#index'

	# get 'search', to: 'application#search'
	get 'cds/about_us' => 'cds#about_us'
	get 'cds/greeting' => 'cds#greeting'
	get 'cds/work' => 'cds#work'
	get 'cds/search' => 'cds#search'
	get 'carts/:id/select' => 'carts#select'
	post 'carts/:id/confirm' => 'carts#confirm', as: 'confirm'
	get 'users/:id/quit' => 'users#quit', as: 'quit' # 退会ページへのパス
	get 'users/:id/favorites' => 'favorites#favorite', as: "favorites"
	get 'users/:id/history' => 'users#history', as: 'user_history'
	get 'admin/users/:id/restore' => 'admin/users#restore', as: 'admin_user_restore' # 論理削除で退会させた人を復元させる

	# 論理削除後にログイン状態を維持してしまうので、強制ログアウトを行う
	devise_scope :user do
		get '/logout', to: 'users/sessions#destroy', as: "logout"
	end

	resources :deliveries, except: [:index, :show]

	resources :cds do
		resource :cd_carts
		resources :discs, except: [:index, :show]
		resources :reviews, except: [:destroy]
			# resources :songs
		# end
	end
	resources :carts
	resources :histories, except: [:show]
	resources :genres, except: [:new]
	resources :pop_images, except: [:edit,:update,:show, :new]
	resources :songs
	resources :artists do
		resource :favorites, only: [:create, :destroy]
	end
	resources :campaigns, except: [:show]
	resources :prefectures, except: [:new]
	resource :singers, except: [:show, :index, :edit]
	resources :admins
	resources :cd_histories, only: [:show]
	resources :cd_genres, only: [:show]
	resources :rankings, only: [:index, :destroy, :create]

end
