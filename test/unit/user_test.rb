require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = "RhysWatkins"
  	user.email = "rhyswatkins@btinternet.com"
  	user.first_name = "Rhys"
  	user.last_name = "Watkins"
  	user.password = "password"
  	user.password_confirmation = "password"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
	user = User.new(first_name: 'Rhys', last_name: 'Watkins', email: 'email@email.com')
  user.password = user.password_confirmation = 'password'

	user.profile_name = "My Profile Without Spaces"
  
	assert !user.save
	assert !user.errors[:profile_name].empty?
	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do 
    user = User.new(first_name: 'Rhys', last_name: 'Watkins', email: 'email@email.com')
    user.password = user.password_confirmation = 'password'
    user.profile_name = 'RhysWatkins2'
    assert user.valid?
  end

end

