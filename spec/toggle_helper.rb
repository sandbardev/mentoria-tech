# frozen_string_literal: true

module Helpers
  def enable_toggle(toggle_name)
    allow_any_instance_of(Flipper).to receive(:enabled?).with(toggle_name).and_return(true)
  end

  def disable_toggle(toggle_name)
    allow_any_instance_of(Flipper).to receive(:enabled?).with(toggle_name).and_return(false)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
