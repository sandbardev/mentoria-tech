# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ServiceCheckController, type: :request do
  context 'checking application health' do
    before { get api_v1_service_check_index_path }
    it { expect(response).to have_http_status(:ok) }
  end
end
