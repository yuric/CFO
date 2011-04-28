require 'test_helper'

class RawnessesControllerTest < ActionController::TestCase
  setup do
    @rawness = rawnesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rawnesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rawness" do
    assert_difference('Rawness.count') do
      post :create, :rawness => @rawness.attributes
    end

    assert_redirected_to rawness_path(assigns(:rawness))
  end

  test "should show rawness" do
    get :show, :id => @rawness.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rawness.to_param
    assert_response :success
  end

  test "should update rawness" do
    put :update, :id => @rawness.to_param, :rawness => @rawness.attributes
    assert_redirected_to rawness_path(assigns(:rawness))
  end

  test "should destroy rawness" do
    assert_difference('Rawness.count', -1) do
      delete :destroy, :id => @rawness.to_param
    end

    assert_redirected_to rawnesses_path
  end
end
