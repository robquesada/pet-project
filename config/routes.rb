Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'iniciar', to: 'login#index', as: 'login'
  get '/', to: 'main#home', as: 'home'

  resources :pets, path: 'mascotas'
  resources :lost_reports, path: 'extravios' do
    resource :flyer, path: 'cartel', only: :show
  end

  get 'perfil', to: 'users#index', as: 'profile'

  root 'main#home'
end
