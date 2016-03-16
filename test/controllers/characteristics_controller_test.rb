require 'test_helper'

class CharacteristicsControllerTest < ActionController::TestCase
  setup do
    @student = students(:first)
    @characteristic = @student.characteristic(:one)
  end

  test "should show characteristic" do
    get :show, id: @characteristic, student_id: @characteristic.student_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @characteristic, student_id: @characteristic.student_id
    assert_response :success
  end

  test "should update characteristic" do
    patch :update, id: @characteristic, student_id: @characteristic.student_id, characteristic: { content: @characteristic.content,title: @characteristic.title }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy characteristic" do
    assert_difference('Characteristic.count', -1) do
      delete :destroy, id: @characteristic, student_id: @characteristic.student_id
    end
     assert_redirected_to student_path(assigns(:student))
  end
end
