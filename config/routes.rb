Rails.application.routes.draw do
  root 'home#index'
  get 'translate', to: 'home#translate'
  get 'about_us', to: 'about_us#show'
  get 'maintenance', to: 'maintenance#show'
  scope 'markets' do
    get 'ocean_areas', to: 'markets#ocean_areas', as: :ocean_areas
    get 'land_areas', to: 'markets#land_areas', as: :land_areas
    get 'aerospace', to: 'markets#aerospace', as: :aerospace
  end
  scope 'products', as: 'products' do
    get 'car_mobile_communication_antenna_point_6', to: 'products#car_mobile_communication_antenna_point_6', as: :car_mobile_communication_antenna_point_6
    get 'car_mobile_communication_antenna_point_9', to: 'products#car_mobile_communication_antenna_point_9', as: :car_mobile_communication_antenna_point_9
    get 'portable_transportable_satellite_station', to: 'products#portable_transportable_satellite_station', as: :portable_transportable_satellite_station
    get 'shipboard_antenna_c', to: 'products#shipboard_antenna_c', as: :shipboard_antenna_c
    get 'shipboard_antenna_ku', to: 'products#shipboard_antenna_ku', as: :shipboard_antenna_ku
    get 'through_static_antenna', to: 'products#through_static_antenna', as: :through_static_antenna
  end
  resources :downloads do
    collection do
      get :video
    end
  end
  resources :jobs do
    collection do
      get :apply_form
      post :apply
    end
  end
  namespace 'assembling' do
    concern :rotatable do
      member do
        get 'angle_1'
      end
    end
    resource 'ford_f150', controller: 'ford_f150', concerns: :rotatable
  end
end
