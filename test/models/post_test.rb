require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:test)
    @post = Post.new(title: "hogehoge", user_id: @user.id)
  end

  test "postの有効性検証" do
    assert @post.valid?
  end

  test "存在しているuser_idのみpostを作れる" do
    @user.id = nil
    assert_not @post.valid?
  end
end
