class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  
  
         with_options presence: true do

          half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i #半角英数字どちらも
          full_width_characters = /\A[ぁ-んァ-ン一-龥]/  #全角
          full_width_kana = /\A[ァ-ヶー－]+\z/ #全角カナ
          
          validates :nickname
          validates :password, format: { with: half_width_alphanumeric , message: "Include both letters and numbers"} #半角英数字どちらも
          validates :password_confirmation
          validates :last_name, format: { with: full_width_characters, message: "Last name Full-width characters"} #全角
          validates :first_name, format: { with: full_width_characters, message: "Full-width characters"} #全角
          validates :last_name_kana, format: { with: full_width_kana, message: "Full-width characters"} #全角カナ
          validates :first_name_kana, format: { with: full_width_kana, message: "Full-width characters"} #全角カナ
          validates :birth_day
          
      
        end


end

 
