Rails.application.routes.draw do
  
  resources :interventions do
    collection do
      get :get_buildings_for_customer
      get :get_batteries_for_building
      get :get_columns_for_battery
      get :get_elevators_for_column
    end
  end

  devise_for :users
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads

  
  root 'leads#new'
  get 'geolocation/google'
  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'intervention' => 'intervention#new' #intervention request form
  get 'login' => 'pages#login'
  get 'sign_up' => 'users#sign_up'
  get 'sign_in' => 'users#sign_in'
  get 'leads' => 'leads#new'
  get 'pokemon' => 'pages#pokemon'

  # namespace :admin do
  #   resources :addresses do
  #     resources :customers do
  #       resources :buildings do
  #         resources :building_details
  #       end
  #     end
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
