module FunkyForm
  module ClassMethods
    def model_name(model_name = nil)
      if model_name
        @model_name = model_name
      else
        @model_name ||= super()
      end
    end

    private

    def model(klass = nil)
      if klass.respond_to?(:model_name)
        model_name klass.model_name
      elsif klass.is_a?(String)
        model_name ActiveModel::Name.new(self, nil, klass)
      end
    end
  end
end
