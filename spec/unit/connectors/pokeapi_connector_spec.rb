# frozen_string_literal: true

require 'rails_helper'

describe PokeapiConnector do
  subject { PokeapiConnector.new }

  context 'when getting all pokemons from api' do
    # context 'should return list of pokemons' do
    #   let(:expected) do
    #     { 'count' => 1118, 'next' => 'https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20', 'previous' => nil,
    #       'results' => [{ 'name' => 'bulbasaur', 'url' => 'https://pokeapi.co/api/v2/pokemon/1/' },
    #                     { 'name' => 'ivysaur', 'url' => 'https://pokeapi.co/api/v2/pokemon/2/' },
    #                     { 'name' => 'venusaur', 'url' => 'https://pokeapi.co/api/v2/pokemon/3/' },
    #                     { 'name' => 'charmander', 'url' => 'https://pokeapi.co/api/v2/pokemon/4/' },
    #                     { 'name' => 'charmeleon', 'url' => 'https://pokeapi.co/api/v2/pokemon/5/' },
    #                     { 'name' => 'charizard', 'url' => 'https://pokeapi.co/api/v2/pokemon/6/' },
    #                     { 'name' => 'squirtle', 'url' => 'https://pokeapi.co/api/v2/pokemon/7/' },
    #                     { 'name' => 'wartortle', 'url' => 'https://pokeapi.co/api/v2/pokemon/8/' },
    #                     { 'name' => 'blastoise', 'url' => 'https://pokeapi.co/api/v2/pokemon/9/' },
    #                     { 'name' => 'caterpie', 'url' => 'https://pokeapi.co/api/v2/pokemon/10/' },
    #                     { 'name' => 'metapod', 'url' => 'https://pokeapi.co/api/v2/pokemon/11/' },
    #                     { 'name' => 'butterfree', 'url' => 'https://pokeapi.co/api/v2/pokemon/12/' },
    #                     { 'name' => 'weedle', 'url' => 'https://pokeapi.co/api/v2/pokemon/13/' },
    #                     { 'name' => 'kakuna', 'url' => 'https://pokeapi.co/api/v2/pokemon/14/' },
    #                     { 'name' => 'beedrill', 'url' => 'https://pokeapi.co/api/v2/pokemon/15/' },
    #                     { 'name' => 'pidgey', 'url' => 'https://pokeapi.co/api/v2/pokemon/16/' },
    #                     { 'name' => 'pidgeotto', 'url' => 'https://pokeapi.co/api/v2/pokemon/17/' },
    #                     { 'name' => 'pidgeot', 'url' => 'https://pokeapi.co/api/v2/pokemon/18/' },
    #                     { 'name' => 'rattata', 'url' => 'https://pokeapi.co/api/v2/pokemon/19/' },
    #                     { 'name' => 'raticate', 'url' => 'https://pokeapi.co/api/v2/pokemon/20/' }] }
    #   end
    #   it { expect(subject.get_all).to eq(expected) }
    # end

    before do
      allow(HTTParty).to receive(:get).and_return(mocked_response)
    end

    context 'when connected succesfully to API endpoint' do
      let(:pokeapi_url) { 'https://pokeapi.co/api/v2/pokemon/' }
      let(:parsed_response) { 'jooj' }
      let(:mocked_response) { instance_double(HTTParty::Response, code: 200, parsed_response: parsed_response) }

      it { expect(subject.get_all).to eq(parsed_response) }
    end

    context 'when failing to connect' do
      let(:error_url) { 'https://httpstat.us/500' }
      let(:mocked_response) { instance_double(HTTParty::Response, code: 500) }

      it { expect { subject.get_all }.to raise_error(StandardError) }
    end
  end
  # context 'when failing to connect' do
  #   it 'should raise error' do
  #     expect(subject.list_all).to raise_error()
  #   end
  # end
end
