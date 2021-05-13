# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nick_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :deliveries
- has_many :items
- has_many :buys, through:



## items テーブル

| Column            | Type       | Options      |
| ----------------- | ---------- | ------------ |
| image             | string     | null: false  |
| item_name         | string     | null: false  |
| description       | string     | null: false  |
| status            | string     | null: false  |
| deliverry_charge  | string     | null: false  |
| area              | string     | null: false  |
| day               | string     | null: false  |
| price             | integer    | null: false |
| fee               | integer    | null: false |
| sales_profit      | integer    | null: false |
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

- belongs_to :buys
- belongs_to :deliveries
- belongs_to :item



## deliveries テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| posttal_cood  | string     | null: false  |
| perfecture    | string     | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  | 
| building_name | string     |              |
| phone_naumber | string     | null: false  |
| user     | references | null: false, foreign_key: true |

### Association

- has_one :buys
- belongs_to :users