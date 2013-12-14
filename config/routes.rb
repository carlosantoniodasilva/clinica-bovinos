ClinicaBovinos::Application.routes.draw do
  resources_path_names :new => "novo", :edit => "editar"

  resources :bovinos, except: :show
  resources :fazendas, except: :show
  root to: 'home#index'
end
