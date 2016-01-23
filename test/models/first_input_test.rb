require 'test_helper'


class FirstInputTest < ActionController::TestCase
	

#HTML existence tests
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Sample App"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Sample App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Sample App"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Sample App"
  end
end


#field input tests
class FirstInputTest2 < ActiveSupport::TestCase

  def setup
    @test_input = FirstInput.new(num_options: 6, deal_type: "Product Deal", biz_name: "Spa Town", longer_descriptor: "60-Minute Facials", multi_voucher: false)
  end
  

  test "should be valid" do
    assert @test_input.valid?
  end
    
  test "num_options should be present" do
    @test_input.num_options = "     "
    assert_not @test_input.valid?
  end

  test "deal_type should be present" do
    @test_input.deal_type = "     "
    assert_not @test_input.valid?
  end
    test "biz_name should be present" do
    @test_input.biz_name = "     "
    assert_not @test_input.valid?
  end
    test "longer_descriptor should be present" do
    @test_input.longer_descriptor = "     "
    assert_not @test_input.valid?
  end

end

