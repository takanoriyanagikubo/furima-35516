# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: fals                |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :buys



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| deliverry_charge_id | integer    | null: false                    |
| area_id             | integer    | null: false                    |
| day_id              | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :user



## buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |


### Association

- has_one :deliverie
- belongs_to :item
- belongs_to :user

 
## deliveries テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_code   | string     | null: false  |
| area_id       | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  | 
| building_name | string     |              |
| phone_naumber | string     | null: false  |

### Association

- belongs_to :buy
