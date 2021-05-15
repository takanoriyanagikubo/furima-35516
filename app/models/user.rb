class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password,null: false, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
        
         with_options presence: true do
          validates :nick_name, null: false 
          validates :email, null: false 
          validates :first_name, null: false, format: { with: /\A[ぁ-んァ-ン一-龥]/} 
          validates :last_name, null: false, format: { with: /\A[ぁ-んァ-ン一-龥]/} 
          validates :first_name_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/} 
          validates :last_name_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/} 
          validates :birthday, null: false 
        end

         #validates :password, presence: true, length: { minimum: 6 }
         #VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         #validates :password, format: { with: VALID_PASSWORD_REGEX
     

         

end
