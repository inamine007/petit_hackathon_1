require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new( name: "tes", email: "tes@user.com",
                      password: "tespass", password_confirmation: "tespass")
  end

  test "ユーザーアカウントの有効性テスト" do
    assert @user.valid?
  end

  test "名前の有効性テスト(空文字はだめ)" do
    @user.name = "  "
    assert_not @user.valid?  #falseならテストパスする
                              #（true => 空文字, false => not空文字）
  end

  test "名前の有効性テスト（50文字以内）" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "メールアドレスの有効性テスト（空文字はだめ）" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "メールアドレスの有効性テスト(255以内)" do
    @user.email = "a" * 256
    assert_not @user.valid?

  end

  test "メールアドレスの一意性テスト" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase # 通常メールアドレスは、大文字、小文字の区別をしない。なので、その仕様にする。
    @user.save # @userを、dbに保存し、複製ユーザーと区別する。

    assert_not dup_user.valid? # 既にdbに同一のアドレスを持ったユーザーがいるため、存在してはいけない。
  end

  test "パスワードの有効性テスt（空文字はNG）" do
    @user.password = @user.password_confirmation = "   "  # password_confirmationも一緒にテストする
    assert_not @user.valid?
  end

  test "パスワードの有効性テスト（６文字以上）" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
