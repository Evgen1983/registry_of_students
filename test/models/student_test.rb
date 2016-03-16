require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  def setup
  	@student = Student.new(first_name: "Ботан", last_name: "Ботанов", learning_team: "Bt-01", birthday: '2016-02-24', 
  	  email: "botan@mail.ru", ip_adress: "MyString")
  end
  
  test "should be valid" do
    assert @student.valid?
  end
  
  test "first_name should be present" do
    @student.first_name = "     "
    assert_not @student.valid?
  end
  
  test "last_name should be present" do
    @student.last_name = "     "
    assert_not @student.valid?
  end
  
  test "learning_team should be present" do
    @student.learning_team = "     "
    assert_not @student.valid?
  end
  
  test "email should be present" do
    @student.email = "     "
    assert_not @student.valid?
  end
  
  test "birthday should be present" do
    @student.birthday = "     "
    assert_not @student.valid?
  end

  test "ip_adress should be present" do
    @student.ip_adress = "     "
    assert_not @student.valid?
  end
  
  test "first_name should not be too long" do
    @student.first_name = "a" * 21
    assert_not @student.valid?
  end
  
  test "last_name should not be too long" do
    @student.last_name = "a" * 21
    assert_not @student.valid?
  end

  test " learning_team should not be too long" do
    @student.learning_team = "a" * 21
    assert_not @student.valid?
  end

  test "first_name should not be too short" do
    @student.first_name = "a" 
    assert_not @student.valid?
  end

  test "last_name should not be too short" do
    @student.last_name = "a"
    assert_not @student.valid?
  end
  
  test " learning_team should not be too short" do
    @student.learning_team = "a" 
    assert_not @student.valid?
  end
  
   test " e-mail should not be too long" do
    @student.email = "a" * 244 + "@example.com"
    assert_not @student.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @student.email = valid_address
      assert @student.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @student.email = invalid_address
      assert_not @student.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_student = @student.dup
    duplicate_student.email = @student.email.upcase
    @student.save
    assert_not duplicate_student.valid?
  end

end
