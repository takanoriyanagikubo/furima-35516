class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password,null: false, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
        
         with_options presence: true do
          validates :nick_name, null: false 
          validates :email, null: false 
          validates :first_name, null: false, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/} 
          validates :last_name, null: false, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/} 
          validates :first_name_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/} 
          validates :last_name_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/} 
          validates :birthday, null: false 
        end
end
