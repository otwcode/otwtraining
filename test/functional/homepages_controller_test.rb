require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homepages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homepage" do
    assert_difference('Homepage.count') do
      post :create, :homepage => { }
    end

    assert_redirected_to homepage_path(assigns(:homepage))
  end

  test "should show homepage" do
    get :show, :id => homepages(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => homepages(:one).id
    assert_response :success
  end

  test "should update homepage" do
    put :update, :id => homepages(:one).id, :homepage => { }
    assert_redirected_to homepage_path(assigns(:homepage))
  end

  test "should destroy homepage" do
    assert_difference('Homepage.count', -1) do
      delete :destroy, :id => homepages(:one).id
    end

    assert_redirected_to homepages_path
  end
end
