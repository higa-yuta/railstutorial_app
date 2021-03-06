require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(name: "Okinawa taro", email: 'okinawa@example.com',
                    password: "foobar", password_confirmation: "foobar")
  end


  # NAME attribute
  test "should be valid" do
    assert @user.valid?
  end

  test "name should bhe present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  
  # E-mail attribute
  test "email should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
    @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_email = %w[user@example,com user_at_foo.org user.name@example.
                      foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_email.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{@user.email.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    other_user = @user.dup
    @user.save
    other_user.email
    assert_not other_user.valid?

    other_user.email.upcase!
    assert_not other_user.valid?
  end

  test "email address to lowercase before saving" do
    @user.email.upcase!
    @user.save
    assert_equal "okinawa@example.com", User.first.email
    # assert_equal "okinawa@example.com", @user.reload.email
  end


  # PASSWORD

  test "password should be valid" do
    @user.password = @user.password_confirmation = "a" * 6
    assert @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  # test "password should be not space" do
  #   @user.password = @user.password_confirmation = "a aaaa"
  #   assert_not @user.valid?
  # end

end
