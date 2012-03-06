# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require "test/unit"
require "funky_form"

class Test::Unit::TestCase
  private

  def new_funky_form(&block)
    Class.new(FunkyForm::Base) do
      def self.name
        "Job"
      end

      instance_eval(&block)
    end
  end

  class Job
    attr_accessor :title

    def initialize(attributes = {})
      attributes.each do |key, value|
        send(:"#{key}=", value)
      end
    end
  end
end
