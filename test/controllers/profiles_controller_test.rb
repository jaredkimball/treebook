require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jared).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render 404 on profile not found" do
  	get :show, id: "Doesn't exist"
  	assert_response :not_found
  end


  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:jared).profile_name
  	 #assigns method makes sure proper instance variables are assigned to user
  	 assert assigns(:user)
  	 #make sure that there is atleast 1 variable assigned
  	assert_not_empty assigns(:statuses) 
  end

  test "only shows correct user's statuses" do
  	get :show, id: users(:jared).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jared), status.user
  	end
  end

end
