require "test_helper"

class TypecastsTest < Test::Unit::TestCase
  def test_typecast_to_string
    form = new_funky_form do
      attribute :title, :type => String
    end
    assert_equal "123", form.new(:title => 123).title
  end

  def test_typecast_to_integer
    form = new_funky_form do
      attribute :length, :type => Integer
    end
    assert_equal 666, form.new(:length => "666").length
  end
end
