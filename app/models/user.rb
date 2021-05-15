class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nick_name, null: false 
         validates :email, null: false 
         validates :encrypted_password,null: false
         validates :first_name, null: false 
         validates :last_name, null: false 
         validates :first_name_kana, null: false 
         validates :first_name_kana, null: false 
         validates :birthday, null: false 

         #validates :password, presence: true, length: { minimum: 6 }
         #VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         #validates :password, format: { with: VALID_PASSWORD_REGEX

         

end
