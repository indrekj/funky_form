module FunkyForm
  class Attribute
    def initialize(type, options)
      @type = type
      @options = options
      @value = nil
    end

    def set(value)
      @value = value
    end

    def valid?
      !@options[:presence] || @value.to_s.size > 0
    end
  end
end
