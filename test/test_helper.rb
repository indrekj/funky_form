# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require "minitest/autorun"
require_relative "../lib/funky_form"

class MiniTest::Test
  private

  def new_funky_form(&block)
    Class.new do
      include FunkyForm
      model "Anonymous"
      instance_eval(&block) if block_given?
    end
  end
end
