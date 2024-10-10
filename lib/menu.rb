require 'net/http'
require 'json'

def show_menu
  puts "1. Listar pokemones"
  puts "2. Capturar pokemon"
  puts "3. Listar capturados"
  puts "4. Liberar pokemon"
  puts "5. Importar pokemones"
  puts "0. Salir"
end

def fetch_pokemons(page)
  url = URI("http://localhost:3000/pokemons?page=#{page}")
  response = Net::HTTP.get_response(url)
  puts JSON.pretty_generate(JSON.parse(response.body))
end

def capture_pokemon(id)
  url = URI("http://localhost:3000/pokemons/#{id}/capture")
  Net::HTTP.post(url, nil)
  puts "Pokemon #{id} capturado."
end

def list_captured
  url = URI("http://localhost:3000/pokemons/captured")
  response = Net::HTTP.get_response(url)
  puts JSON.pretty_generate(JSON.parse(response.body))
end

def release_pokemon(id)
  url = URI("http://localhost:3000/pokemons/#{id}")
  Net::HTTP.delete(url)
  puts "Pokemon #{id} liberado."
end
  
def import_pokemons
  url = URI("http://localhost:3000/pokemons/import")
  Net::HTTP.post(url, nil)
  puts "Pokemons importados correctamente."
end

loop do
  show_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Ingrese la página que desea listar:"
    page = gets.chomp.to_i
    fetch_pokemons(page)
  when 2
    puts "Ingrese el ID del pokemon que desea capturar:"
    id = gets.chomp.to_i
    capture_pokemon(id)
  when 3
    list_captured
  when 4
    puts "Ingrese el ID del pokemon que desea liberar:"
    id = gets.chomp.to_i
    release_pokemon(id)
  when 5
    import_pokemons
  when 0
    break
  else
    puts "Opción no válida, intente nuevamente."
  end
end
