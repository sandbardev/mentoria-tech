# frozen_string_literal: true

class PokeapiConnector
  def get_all
    request = HTTParty.get('https://pokeapi.co/api/v2/pokemon/')

    raise StandardError, 'IntegrationError' unless request.code == 200

    request.parsed_response
  end
end
