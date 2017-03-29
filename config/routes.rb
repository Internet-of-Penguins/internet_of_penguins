Rails.application.routes.draw do

resources :devices do
resources :datas
end
  root "welcome#index"

end
