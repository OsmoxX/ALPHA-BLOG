require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category shold be valid" do
    assert @category.valid?
  end

  test "Category name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "Category name should be unique" do
      @category.save
      @category2 = Category.new(name: "Sports")
      assert_not @category2.valid?
  end

  test "Category name should not be too long" do
    @category.name = "a" * 51
    assert_not @category.valid?
  end

  test "Category name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end