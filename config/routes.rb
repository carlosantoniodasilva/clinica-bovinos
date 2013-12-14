ClinicaBovinos::Application.routes.draw do
  resources :inseminacoes

  resources_path_names new: "novo", edit: "editar"

  with_options except: :show do |opt|
    opt.resources :bovinos
    opt.resources :fazendas
    opt.resources :inseminadores
    opt.resources :rebanhos, except: :show do
      resources :bovinos, only: [:index, :create, :destroy], controller: 'rebanhos/bovinos'
    end
  end

  root to: 'home#index'
end
