class ApplicationController < ActionController::Base
    include SessionsHelper  # => どのコントローラーからでも、sessions_helperが呼び出せるようになる
end
