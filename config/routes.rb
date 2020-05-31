Rails.application.routes.draw do
  root to: 'main#index'

  get '/config', to: 'main#init'
  post '/checkout', to: 'checkout#create'

  get '/success', to: 'checkout#success'
  get '/cancel', to: 'checkout#cancel'
end
