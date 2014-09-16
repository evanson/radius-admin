require 'test_helper'

class RadchecksControllerTest < ActionController::TestCase
  setup do
    @radcheck = radchecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:radchecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create radcheck" do
    assert_difference('Radcheck.count') do
      post :create, radcheck: {  }
    end

    assert_redirected_to radcheck_path(assigns(:radcheck))
  end

  test "should show radcheck" do
    get :show, id: @radcheck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @radcheck
    assert_response :success
  end

  test "should update radcheck" do
    patch :update, id: @radcheck, radcheck: {  }
    assert_redirected_to radcheck_path(assigns(:radcheck))
  end

  test "should destroy radcheck" do
    assert_difference('Radcheck.count', -1) do
      delete :destroy, id: @radcheck
    end

    assert_redirected_to radchecks_path
  end
end
