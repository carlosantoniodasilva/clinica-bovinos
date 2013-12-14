ClinicaBovinos::Application.routes.draw do
  resources_path_names new: "novo", edit: "editar"

  resources :bovinos, except: :show
  resources :fazendas, except: :show
  resources :rebanhos, except: :show do
    resources :bovinos, only: [:index, :create, :destroy], controller: 'rebanhos/bovinos'
  end

  root to: 'home#index'
end
