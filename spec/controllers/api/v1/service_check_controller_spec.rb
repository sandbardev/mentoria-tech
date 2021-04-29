# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

describe Api::V1::ServiceCheckController, type: :request do
  subject do
    get api_v1_service_check_index_path
    response
  end

  context 'when checking application health' do
    it 'should return ok' do
      enable_toggle('service_check')
      expect(subject).to have_http_status(:ok)
    end

    it 'with toggle feature disabled' do
      expect(subject).to have_http_status(:not_found)
    end
  end
end
