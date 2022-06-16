Rails.application.routes.draw do
  resources :messages
  scope '/auth' do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
  end
end
