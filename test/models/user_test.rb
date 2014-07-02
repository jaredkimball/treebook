require 'test_helper'

class UserTest < ActiveSupport::TestCase

	should have_many(:user_friendships)
	should have_many(:friends)


 	test "a user should enter their first name" do
 		user = User.new

 		assert !user.save
 		assert !user.errors[:first_name].empty?
 	end


 	test "a user should enter their profile name" do
 		user = User.new

 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 	end

 	test "a user should enter their last name" do
 		user = User.new

 		assert !user.save
 		assert !user.errors[:last_name].empty?
 	end

 	test "a user should have a unique profile_name" do
 		user = User.new

 		user.profile_name = users(:jared).profile_name

 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 	end

 	test "a user should have a profile name without spaces" do
 		user = User.new(first_name: 'JT', last_name: 'Audi', email: 'jared@tt.ca');
 		user.password = user.password_confirmation = 'asdfasdf';

 		user.profile_name = 'jared kimball 1'

 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 		assert user.errors[:profile_name].include?("Must be formatted correctly")
 	end

 	test "a user can have a correctly formatted profile name" do
 		user = User.new(first_name: 'Jared', last_name: 'Kimball', email: 'jared@ffweb.ca');
 		user.password = user.password_confirmation = 'asdfasdf';

 		user.profile_name = 'jaredkim_1'
 		assert user.valid?
 	end

 	test "that no error raised when trying to access a friend list" do
 		assert_nothing_raised do
 			users(:jared).friends
 		end
 	end

 	test "that creating friendships on a user works" do
 		users(:jared).friends << users(:mike)
 		users(:jared).friends.reload
 		assert users(:jared).friends.include?(users(:mike))
 	end


end
