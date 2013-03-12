require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  setup do
    @test = tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post :create, test: { a_binary: @test.a_binary, b_boolean: @test.b_boolean, c_date: @test.c_date, d_datetime: @test.d_datetime, e_decimal: @test.e_decimal, f_float: @test.f_float, g_integer: @test.g_integer, h_string: @test.h_string, i_text: @test.i_text, j_time: @test.j_time }
    end

    assert_redirected_to test_path(assigns(:test))
  end

  test "should show test" do
    get :show, id: @test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test
    assert_response :success
  end

  test "should update test" do
    put :update, id: @test, test: { a_binary: @test.a_binary, b_boolean: @test.b_boolean, c_date: @test.c_date, d_datetime: @test.d_datetime, e_decimal: @test.e_decimal, f_float: @test.f_float, g_integer: @test.g_integer, h_string: @test.h_string, i_text: @test.i_text, j_time: @test.j_time }
    assert_redirected_to test_path(assigns(:test))
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete :destroy, id: @test
    end

    assert_redirected_to tests_path
  end
end
