# frozen_string_literal: true

class PokeapiConnector
  def get_all
    request = HTTParty.get('https://httpstat.us/500')

    raise StandardError, 'IntegrationError' unless request.code == 200

    request.parsed_response
  end
end
