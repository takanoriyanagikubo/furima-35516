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

- has_many :deliveries
- has_many :items
- has_many :buys, through:



## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| description       | string     | null: false                    |
| status            | string     | null: false                    |
| deliverry_charge  | string     | null: false                    |
| area              | string     | null: false                    |
| day               | string     | null: false                    |
| price             | integer    | null: false                    |
| fee               | integer    | null: false                    |
| sales_profit      | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_one :buys
- belongs_to :users



## buys テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :buys  


## deliveries テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_cood   | string     | null: false  |
| perfecture    | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  | 
| building_name | string     |              |
| phone_naumber | string     | null: false  |

### Association


- belongs_to :user
- belongs_to :deliveries