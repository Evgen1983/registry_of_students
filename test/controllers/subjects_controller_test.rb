require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  setup do
    @student = students(:second)
    @subject = subjects(:onee)
  end

  test "should get index" do
    get :index, student_id: @subject.student_id
    assert_response :success
    assert_not_nil assigns(:subjects)
  end


  test "should create subject" do
    assert_difference('Subject.count') do
      post :create, student_id: @subject.student_id, subject: { grade: @subject.grade, name: @subject.name, semestr: @subject.semestr }
    end
   assert_redirected_to student_path(assigns(:student))
  end

  test "should show subject" do
    get :show, id: @subject, student_id: @subject.student_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject, student_id: @subject.student_id
    assert_response :success
  end

  test "should update subject" do
    patch :update, id: @subject, student_id: @subject.student_id, subject: { grade: @subject.grade, name: @subject.name, semestr: @subject.semestr }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete :destroy, id: @subject, student_id: @subject.student_id
    end
    assert_redirected_to student_path(assigns(:student))
  end
end
