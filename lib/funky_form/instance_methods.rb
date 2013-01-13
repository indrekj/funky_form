module FunkyForm
  module InstanceMethods
    # @param [#to_hash, #attributes] target
    def initialize(target = {})
      if target.respond_to?(:attributes)
        super(target.attributes)
      else
        super
      end
    end

    def persisted?
      defined?(id) && !id.nil?
    end
  end
end
