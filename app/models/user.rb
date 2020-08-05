class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
         with_options presence: true do
          validates :nickname
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers"} #半角英数字
          validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"} #全角
          validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"} #全角
          validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"} #全角カナ
          validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"} #全角カナ
          validates :birth_day
          
      
        end


end

 
