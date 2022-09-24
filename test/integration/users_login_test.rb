require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "flashの表示テスト" do
    get login_path
    assert_template 'sessions/new'  # => login_pathに適切なviewが表示されているか。
    post login_path, params: { session: { email: @user.email, password: "invalid" } } # => 無効なuser情報をpostする。
    assert_not  is_logged_in?
    assert_template 'sessions/new' 
    assert_not flash.empty? # => flashが空じゃなかったらOK（表示されていたら、OK）
    get login_path  # => ページを移動
    assert flash.empty? # => flashが空だったら、OK（　flashが、無表示ならOK）
  end

  test "ログインテスト" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user      # => リダイレクト先が正しいかチェック。
    follow_redirect!              # => 実際にページを移動する。
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end
end
