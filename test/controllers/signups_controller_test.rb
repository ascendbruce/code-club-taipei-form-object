require 'test_helper'

# those test cases are not in good practices. it's just for workshops.

class SignupsControllerTest < ActionController::TestCase

  def valid_params
    { "company" => { "name" => "Night Market Life", "users_attributes" => [ { "name" => "Michael", "email" => "michael@example.com" } ] } }
    # { "signup_form" => { "company_name" => "Night Market Life", "name" => "Michael", "email" => "michael@example.com" } }
  end

  test "should post create and redirect_to comapnay show" do
    post :create, valid_params
    assert_redirected_to company_path(Company.last)
  end

  test "should post create and save company.name" do
    post :create, valid_params
    assert_equal "Night Market Life", Company.last.name
  end

  test "should post create and save company.user.name" do
    post :create, valid_params
    assert_equal "Michael", Company.last.users.last.name
  end

  test "should post create and save company.user.email" do
    post :create, valid_params
    assert_equal "michael@example.com", Company.last.users.last.email
  end

  test "should not save duplicated email" do
    post :create, valid_params
    assert_equal "michael@example.com", Company.last.users.last.email
    assert_no_difference("User.count") do
      post :create, valid_params
    end
  end

end
