require "virtus"
require "active_model"

module FunkyForm
  # Extends class with FunkyForm methods
  #
  # @param [Class] descendant
  def self.included(descendant)
    super
    descendant.send(:include, Virtus)
    descendant.send(:include, ActiveModel::Validations)
    descendant.send(:include, ActiveModel::Conversion)
    descendant.send(:include, InstanceMethods)
    descendant.extend(ClassMethods)
  end
  private_class_method :included
end

require_relative "funky_form/version"
require_relative "funky_form/class_methods"
require_relative "funky_form/instance_methods"
