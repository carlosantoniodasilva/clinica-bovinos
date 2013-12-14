ClinicaBovinos::Application.routes.draw do

  resources_path_names new: "novo", edit: "editar"

  with_options except: :show do |opt|
    opt.resources :bovinos
    opt.resources :fazendas
    opt.resources :inseminadores
    opt.resources :inseminacoes
    opt.resources :rebanhos, except: :show do
      resources :bovinos, only: [:index, :create, :destroy], controller: 'rebanhos/bovinos'
    end
  end

  namespace :relatorios do
    resources :inseminacoes_realizadas, only: [:index, :create]
  end

  root to: 'home#index'
end
