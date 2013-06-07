require_relative "test_helper"

class FunkyFormTest < MiniTest::Test
  parallelize_me!

  def test_values_from_existing_instance
    job = OpenStruct.new(:to_hash => {:title => "existing title"})

    form = new_funky_form do
      attribute :title, String
    end

    assert_equal "existing title", form.new(job).title
  end

  def test_values_from_existing_instance_when_default_value_is_specified
    job = OpenStruct.new(:to_hash => {:title => nil})

    form = new_funky_form do
      attribute :title, String, :default => "developer"
    end

    assert_equal nil, form.new(job).title
  end

  def test_values_from_existing_instance_that_responds_to_attributes
    job = OpenStruct.new(:attributes => {:title => "existing title"})

    form = new_funky_form do
      attribute :title, String
    end

    assert_equal "existing title", form.new(job).title
  end

  def test_default_value
    form = new_funky_form do
      attribute :title, String, :default => "developer"
    end

    assert_equal "developer", form.new.title
  end

  def test_attributes
    form = new_funky_form do
      attribute :title, String
      attribute :length, Integer
    end

    f = form.new("title" => "developer", "length" => "112")
    assert_equal "developer", f.attributes[:title]
    assert_equal 112, f.attributes[:length]
  end

  def test_specifing_invalid_attributes
    form = new_funky_form

    f = form.new(:private => "okou")
    assert_nil f.attributes[:private]
  end

  def test_model_with_activemodel_class
    table_model = Class.new do
      def self.model_name
        ActiveModel::Name.new(self, nil, "Table")
      end
    end

    form_class = new_funky_form do
      model table_model
    end

    assert_equal table_model.model_name, form_class.model_name
  end

  def test_model_with_string
    form_class = new_funky_form do
      model "Order"
    end

    assert_equal "Order", form_class.model_name.to_s
  end

  def test_model_inheritance
    base_class = new_funky_form do
      model "Order"
    end

    form_class = Class.new(base_class)

    assert_equal "Order", form_class.model_name.to_s
  end

  def test_validations
    form = new_funky_form do
      attribute :title, String
      validates :title, :presence => true
    end

    assert form.new(:title => "a title").valid?
    assert !form.new(:title => nil).valid?, "should be invalid when nil"
    assert !form.new(:title => "").valid?, "should be invalid when empty"
    assert !form.new.valid?, "should be invalid when not specified"
  end
end
