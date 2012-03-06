require "active_attr"
require "active_model"

module FunkyForm
  class Base
    include ActiveAttr::TypecastedAttributes
    include ActiveAttr::MassAssignment
    include ActiveAttr::AttributeDefaults
    include ActiveModel::Validations

    private

    def initialize(instance_or_attributes = {})
      if instance_or_attributes.is_a?(Hash)
        super
      else
        set_values_from_instance(instance_or_attributes)
      end
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
