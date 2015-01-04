Rails.application.routes.draw do
  root 'home#index'
  get 'about_us', to: 'about_us#show'
  scope 'markets' do
    get '/', to: 'markets#index', as: :markets
  end
  scope 'products', as: 'products' do
    get 'car_mobile_communication_antenna_point_6', to: 'products#car_mobile_communication_antenna_point_6', as: :car_mobile_communication_antenna_point_6
    get 'car_mobile_communication_antenna_point_9', to: 'products#car_mobile_communication_antenna_point_9', as: :car_mobile_communication_antenna_point_9
    get 'portable_transportable_satellite_station', to: 'products#portable_transportable_satellite_station', as: :portable_transportable_satellite_station
    get 'shipboard_antenna_c', to: 'products#shipboard_antenna_c', as: :shipboard_antenna_c
    get 'shipboard_antenna_ku', to: 'products#shipboard_antenna_ku', as: :shipboard_antenna_ku
    get 'through_static_antenna', to: 'products#through_static_antenna', as: :through_static_antenna
  end
  scope 'assemblings', as: 'assemblings' do
    get 'ford_f150', to: 'assemblings#ford_f150', as: :ford_f150
  end
end
