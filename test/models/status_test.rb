require 'test_helper'

class StatusTest < ActiveSupport::TestCase



  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end


  test "status content should be atleast 2 letters long" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "status must have a user id associated with it" do
  	status = Status.new
  	status.content = "Hello"
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

end
