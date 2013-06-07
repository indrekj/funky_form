require "test_helper"
require "minitest-capybara"

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

class AcceptanceTest < MiniTest::Test
  include Capybara::DSL
  include Rails.application.routes.url_helpers
end
