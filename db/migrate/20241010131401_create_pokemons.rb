class CreatePokemons < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.boolean :capture_status
      t.string :image

      t.timestamps
    end
  end
end
