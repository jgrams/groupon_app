require 'test_helper'

class FirstInputsControllerTest < ActionController::TestCase
  setup do
    @first_input = first_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_input" do
    assert_difference('FirstInput.count') do
      post :create, first_input: { biz_name: @first_input.biz_name, deal_type: @first_input.deal_type, longer_descriptor: @first_input.longer_descriptor, multi_voucher: @first_input.multi_voucher, num_options: @first_input.num_options }
    end

    assert_redirected_to first_input_path(assigns(:first_input))
  end

  test "should show first_input" do
    get :show, id: @first_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_input
    assert_response :success
  end

  test "should update first_input" do
    patch :update, id: @first_input, first_input: { biz_name: @first_input.biz_name, deal_type: @first_input.deal_type, longer_descriptor: @first_input.longer_descriptor, multi_voucher: @first_input.multi_voucher, num_options: @first_input.num_options }
    assert_redirected_to first_input_path(assigns(:first_input))
  end

  test "should destroy first_input" do
    assert_difference('FirstInput.count', -1) do
      delete :destroy, id: @first_input
    end

    assert_redirected_to first_inputs_path
  end
end
