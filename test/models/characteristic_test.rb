require 'test_helper'

class CharacteristicTest < ActiveSupport::TestCase
 
 def setup
  	@student = students(:first)
    @characteristic = @student.build_characteristic( title: "Title", content: "MyString")
  end
  
  test "should be valid" do
    assert @characteristic.valid?
  end
  
  test "title should be present" do
    @characteristic.title = "     "
    assert_not @characteristic.valid?
  end
   
  test "content should be present" do
    @characteristic.content = "     "
    assert_not @characteristic.valid?
  end

  test "title should not be too short" do
    @characteristic.title = "a" * 4
    assert_not @characteristic.valid?
  end

  test "content should not be too short" do
    @characteristic.content = "a" * 4
    assert_not @characteristic.valid?
  end

end
