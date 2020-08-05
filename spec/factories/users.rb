FactoryBot.define do
  factory :user do
    nickname {'テスト'}
    email {'test@com'}
    password {'test123'}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'花子'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'ハナコ'}
    birth_day {'1930-01-01'}
    
  end
end
