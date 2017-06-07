Rails.application.routes.draw do
	devise_for :users
	resources :devices do
		resources :datas
	end

	get '/api/devices', to: 'welcome#devices_api'
 	root "welcome#index"
end
