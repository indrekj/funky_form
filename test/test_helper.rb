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
