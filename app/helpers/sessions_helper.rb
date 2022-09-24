module SessionsHelper
    def log_in(user) # => 引数のuser（変数）を渡して、ログイン
        session[:user_id] = user.id  # => cookieに保存されているuserのデータを、一時的（ブラウザが閉じるまで）にsessionメソッドに保存できる。
    end
    

    def current_user # => 現在ログイン中のユーザーを返す（いる場合）
        if session[:user_id]
            @current_user ||= User.find_by( id: session[:user_id] ) 
        end
    end

    def logged_in?  # 評価を論理値で返すメソッド　=> userがログインしていたら、true!それ以外はfalseを返す。
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
