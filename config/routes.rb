Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'iniciar', to: 'login#index', as: 'login'
  get '/', to: 'main#home', as: 'home'

  resources :pets, path: 'mascotas' do
    resource :lost_report, path: 'extravios' do
      resource :flyer, path: 'cartel' do
        get :show
        get :preview
      end
    end
  end

  resources :invites, only: :create

  get 'perfil', to: 'users#index', as: 'profile'

  root 'main#home'
end
