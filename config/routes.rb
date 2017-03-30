Rails.application.routes.draw do
devise_for :users
resources :devices do
resources :datas
end
  root "welcome#index"

end
