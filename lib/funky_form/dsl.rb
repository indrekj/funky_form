module FunkyForm
  module DSL
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attribute(name, type, opts = {})
        attribute_set[name] = Attribute.new(type, opts)
      end

      def attribute_set
        @@attribute_set ||= {}
      end
    end

    def initialize(attributes = {})
      attributes.each do |attribute, value|
        if attribute = self.class.attribute_set[attribute.to_sym]
          attribute.set(value)
        end
      end
    end

    def valid?
      self.class.attribute_set.each do |name, attribute|
        return false unless attribute.valid?
      end

      true
    end
  end
end
