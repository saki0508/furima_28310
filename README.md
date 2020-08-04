# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_kana    | string  | null: false |
| first_name_kana   | string  | null: false |
| birth_year_id         | integer | null: false |
| birth_month_id        | integer | null: false |
| birth_day_id          | integer | null: false |
     

### Association 
- has_many :items
- has_one :buyer

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| image            | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer


## buyers テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :buyer



