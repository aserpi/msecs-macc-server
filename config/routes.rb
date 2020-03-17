Rails.application.routes.draw do
  devise_for :workers
  devise_for :admins
  resources :workers
  resources :admins

  devise_scope :admin do
    authenticated :admin do
      root 'control_panel#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :workspaces do
    member do
      get 'edit_workers'
      patch 'transfer_supervision'
  end
end
end
