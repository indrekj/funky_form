require "test_helper"

class FunkyFormTest < Test::Unit::TestCase
  def test_truth
    assert_kind_of Module, FunkyFormTest
  end

  def test_presence_validator
    form = Class.new(FunkyForm::Base) do
      attribute :title, FunkyForm::TextField, :presence => true
    end

    assert form.new(:title => "a title").valid?
    assert !form.new(:title => nil).valid?, "should be invalid when nil"
    assert !form.new(:title => "").valid?, "should be invalid when empty"
    assert !form.new.valid?, "should be invalid when not specified"
  end
end
