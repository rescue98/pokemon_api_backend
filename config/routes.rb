Rails.application.routes.draw do
  resources :pokemons, only: [:index, :destroy] do
    collection do
      post 'import'
      get 'captured'
    end
    member do
      post 'capture'
    end
  end
end

