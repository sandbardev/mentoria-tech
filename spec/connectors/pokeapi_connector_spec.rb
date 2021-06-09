# frozen_string_literal: true

require 'rails_helper'

describe PokeapiConnector do
  subject { PokeapiConnector.new }
  let (:HTTParty) { instance_double(HTTParty) }

  # allow(:HTTParty).to receive(:get).and_return('')

  context 'when getting all pokemons from api' do
    context 'should return list of pokemons' do

      it { expect(subject.get_all).to be_instance_of(Array) }
    end
  end
  # context 'when failing to connect' do
  #   it 'should raise error' do
  #     expect(subject.list_all).to raise_error()
  #   end
  # end
end
