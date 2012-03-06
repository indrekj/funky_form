require "test_helper"

class ValidationsTest < Test::Unit::TestCase
  def test_presence_validator
    form = new_funky_form do
      attribute :title, :type => String
      validates :title, :presence => true
    end

    assert form.new(:title => "a title").valid?
    assert !form.new(:title => nil).valid?, "should be invalid when nil"
    assert !form.new(:title => "").valid?, "should be invalid when empty"
    assert !form.new.valid?, "should be invalid when not specified"
  end
end
