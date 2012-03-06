require "test_helper"

class FunkyFormTest < Test::Unit::TestCase
  def test_truth
    assert_kind_of Module, FunkyFormTest
  end

  def test_values_from_existing_instance
    job = Job.new(:title => "existing title")

    form = new_funky_form do
      attribute :title, :type => String
    end

    assert_equal "existing title", form.new(job).title
  end

  def test_values_from_existing_instance_when_default_value_is_specified
    job = Job.new(:title => nil)

    form = new_funky_form do
      attribute :title, :type => String, :default => "developer"
    end

    assert_equal nil, form.new(job).title
  end

  def test_default_value
    form = new_funky_form do
      attribute :title, :type => String, :default => "developer"
    end

    assert_equal "developer", form.new.title
  end
end
