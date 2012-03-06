require "active_attr"
require "active_model"

module FunkyForm
  class Base
    include ActiveAttr::TypecastedAttributes
    include ActiveAttr::MassAssignment
    include ActiveAttr::AttributeDefaults
    include ActiveModel::Validations

    def initialize(instance_or_attributes = {})
      if instance_or_attributes.is_a?(Hash)
        super
      else
        @instance = instance_or_attributes
        set_values_from_instance(@instance)
      end
    end

    def to_key
      @instance ? [@instance.id] : nil
    end

    def to_model
      @instance || self.class.class_variable_get(:@@model).new
    end

    def to_param
      to_model.to_param
    end

    def self.model_name
      @@model.model_name
    end

    private

    def self.model(klass)
      @@model = klass
    end

    def set_values_from_instance(instance)
      self.class.attribute_names.each do |name|
        if instance.respond_to?(name)
          write_attribute(name, instance.send(name))
        end
      end
    end
  end
end
