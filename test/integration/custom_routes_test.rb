require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  
	#Testing custom routes, just test that it actually goes somewhere --> clearly setup controller#index

	test "that /login route opens login page" do
		get '/login'
		assert_response :success
	end

	test "/logout route logs it out" do
		get '/logout'
		assert_response :redirect
		assert_redirected_to '/'
	end

	test "/register goes to sign up" do
		get '/register'
		assert_response :success
	end


end
