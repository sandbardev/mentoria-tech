class PokeapiConnector
  def get_all
    output = HTTParty.get('https://pokeapi.co/api/v2/pokemon/')
    puts output
    output
  end
end