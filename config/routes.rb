Rails.application.routes.draw do
  root 'home#index'
  get 'about_us', to: 'about_us#show'
  scope 'markets' do
    get '/', to: 'markets#index', as: :markets
  end
  resources :products do
    get :test, on: :collection
  end
end
