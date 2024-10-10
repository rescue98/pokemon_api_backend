require_relative 'lib/menu'  
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
