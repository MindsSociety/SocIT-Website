require 'test_helper'

class NewsletterControllerTest < ActionController::TestCase
  test "should get get_campaigns" do
    get :get_campaigns
    assert_response :success
  end

  test "should get get_campaign" do
    get :get_campaign
    assert_response :success
  end

end
