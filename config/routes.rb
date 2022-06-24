Rails.application.routes.draw do
  get '/messages/mymessages', to: 'messages#my_messages' # 1st place to avoid /messages/my_messages
  get '/messages/user/:username', to: 'messages#user_messages'
  resources :messages
  scope '/auth' do
    get "/users", to: "users#index"
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
  end
end
