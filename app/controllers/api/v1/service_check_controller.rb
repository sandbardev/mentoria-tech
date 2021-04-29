# frozen_string_literal: true

module Api
  module V1
    class ServiceCheckController < ApplicationController
      def index
        return head :ok if Flipper.enabled?('service_check')

        head :not_found
      end
    end
  end
end
