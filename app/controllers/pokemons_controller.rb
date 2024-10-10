class PokemonsController < ApplicationController
    require 'net/http'
    require 'json'
  
    # Listar pokemones con paginación y filtros (nombre o tipo)
    def index
      pokemons = Pokemon.all
  
      # Filtrar por nombre o tipo
      if params[:name].present?
        pokemons = pokemons.where('name LIKE ?', "%#{params[:name]}%")
      elsif params[:type].present?
        pokemons = pokemons.where('types LIKE ?', "%#{params[:type]}%")
      end
  
      total_pokemons = pokemons.count
      page_number = (params[:page] || 1).to_i
      pokemons = pokemons.page(page_number).per(10)
      total_pages = (total_pokemons / 10.0).ceil
  
      render json: {
        pokemons: pokemons.as_json(only: [:name, :types, :image, :capture_status]),
        page: page_number,
        total_pages: total_pages,
        total_pokemons: total_pokemons
      }
    end
  
    # Cambiar el estado de un Pokémon a capturado (máximo 6 capturados a la vez)
    def capture
      pokemon = Pokemon.find(params[:id])
      captured_pokemons = Pokemon.where(capture_status: true)
  
      if captured_pokemons.count >= 6
        oldest_pokemon = captured_pokemons.order(:updated_at).first
        oldest_pokemon.update(capture_status: false)
      end
  
      pokemon.update(capture_status: true)
      render json: { message: "Pokemon #{pokemon.name} capturado." }
    end
  
    # Listar los Pokemones capturados
    def captured
      captured_pokemons = Pokemon.where(capture_status: true)
      render json: captured_pokemons.as_json(only: [:name, :types, :image, :capture_status])
    end
  
    # Cambiar el estado de un Pokémon capturado a no capturado
    def destroy
      pokemon = Pokemon.find(params[:id])
      pokemon.update(capture_status: false)
      render json: { message: "Pokemon #{pokemon.name} liberado." }
    end
  
    # Importar los primeros 150 Pokemones desde PokeAPI
    def import
      url = URI.parse('https://pokeapi.co/api/v2/pokemon?limit=150')
      response = Net::HTTP.get_response(url)
      data = JSON.parse(response.body)
  
      data['results'].each do |poke|
        details_url = URI.parse(poke['url'])
        details_response = Net::HTTP.get_response(details_url)
        details_data = JSON.parse(details_response.body)
  
        types = details_data['types'].map { |t| t['type']['name'] }.join(', ')
  
        Pokemon.create(
          name: details_data['name'],
          types: types,
          capture_status: false,
          image: details_data['sprites']['front_default']
        )
      end
  
      render json: { message: 'Pokemons importados correctamente.' }
    end
  end
  