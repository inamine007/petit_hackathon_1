class User < ApplicationRecord                                    
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy 

    before_save { self.email = email.downcase }  #アドレスの大文字小文字は区別しない。そのため、保存の前に、小文字に変換してから保存。
    validates :name, presence: true, length: { maximum: 50 }

    validates :email, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false } # case_sensitive => 大文字、小文字を区別する。falseで区別しない。
    
    has_secure_password             # デフォルトで、パスワードのバリデーション機能が付いている。テストも起動する。？（ 新規登録時にのみ適用される。　）
                                    # passwordと、password_confirmationが使えるようになる。
                                    # dbのカラムに、password_digestを追加すると使用できるようになる。
    validates :password, presence: true, length: { minimum: 6 }
    
                            # 渡された文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
