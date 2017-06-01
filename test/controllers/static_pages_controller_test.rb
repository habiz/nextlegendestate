require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

#setting up the base_title for my pages
  def setup
    @base_title = 'NextLegend Real Estate'
  end
  test 'should get about' do
    get FILL_IN
    assert_response FILL_IN
  end
  test "should get home" do
    get root
    get static_pages_home_ur
    assert_response :success
    assert_select 'title', 'Home | #{base_title}'
  end

  test "should get services" do
    get services
    get static_pages_services_url
    assert_response :success
    assert_select 'title', 'Services | #{base_title}'
  end

  test "should get gallery" do
    get gallery
    get static_pages_gallery_url
    assert_response :success
    assert_select 'title', 'Gallery | #{base_title}'
  end

  test "should get contact" do
    get contact
    get static_pages_contact_url
    assert_response :success
    assert_select 'title', 'Contact | #{base_title}'
  end

  test "should get signup" do
    get signup
    get static_pages_signup_url
    assert_response :success
    assert_select 'title', 'Signup | #{base_title}'
  end

end
