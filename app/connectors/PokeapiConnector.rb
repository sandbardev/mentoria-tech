class PokeapiConnector
  def get_all
    request = HTTParty.get('https://pokeapi.co/api/v2/pokemon/')
    request.parsed_response
  end
end
