require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {  name: "",
                                          email: "",
                                          password: "foo",
                                          password_confirmation: "bar" }}
    end

    assert_template 'users/new'
    assert_select '#error_explanation' do
      assert_select "li", 5
      assert_select "li", "Name can't be blank", 1
      assert_select "li", "Email can't be blank", 1
    end
    
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {  name: "sample",
                                          email:"sample@example.com",
                                          password: "foobar",
                                          password_confirmation: "foobar" }}
    end
    
    follow_redirect!
    assert_template "users/show"
    assert_select ".alert-success"
    # TODO: 再読込後のflashの有無のテスト
    user = User.first
    get user_path(user.id)
    assert_select ".alert-success", count: 0
    assert_select "h1", "sample"
  end
end
