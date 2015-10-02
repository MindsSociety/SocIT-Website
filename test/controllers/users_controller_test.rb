require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, email_opt_in: @user.email_opt_in, home_directory: @user.home_directory, name: @user.name, phone_number: @user.phone_number, profile_picture: @user.profile_picture, student_number: @user.student_number, username: @user.username }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, email_opt_in: @user.email_opt_in, home_directory: @user.home_directory, name: @user.name, phone_number: @user.phone_number, profile_picture: @user.profile_picture, student_number: @user.student_number, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
