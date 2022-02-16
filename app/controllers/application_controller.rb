class ApplicationController < ActionController::Base

  def hello
    render html: "hello, world!"
    @user_name = "sample taro"
  end
end
