require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "install title helper" do
    assert_equal install_title, "Ruby on Rails Tutorial Sample App"
    assert_equal install_title("About"), "About | Ruby on Rails Tutorial Sample App"
  end
end