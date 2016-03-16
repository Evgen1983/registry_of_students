require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  def setup
  	@student = students(:second)
    @subject = @student.subjects.build( semestr: 1, name: "MyString", grade: 2)
  end
  
  test "should be valid" do
    assert @subject.valid?
  end
   
  test "semestr should be present" do
    @subject.semestr = "     "
    assert_not @subject.valid?
  end
  
  test "name should be present" do
    @subject.name = "     "
    assert_not @subject.valid?
  end
   
  test "grade should be present" do
    @subject.grade = "     "
    assert_not @subject.valid?
  end
  
  test "semestr should be integer" do
    @subject.semestr = 1.11
    assert_not @subject.valid?
  end
  
  test "grade should be integer" do
    @subject.grade = 1.11
    assert_not @subject.valid?
  end
   
   test "semestr should be greater_than_or_equal_to: 1" do
    @subject.semestr = 0
    assert_not @subject.valid?
  end

  test "semestr should be less_than_or_equal_to: 12" do
    @subject.semestr = 13
    assert_not @subject.valid?
  end
  
  test "grade should be greater_than_or_equal_to: 1" do
    @subject.grade = 0
    assert_not @subject.valid?
  end

  test "grade should be less_than_or_equal_to: 5" do
    @subject.grade = 6
    assert_not @subject.valid?
  end

end
