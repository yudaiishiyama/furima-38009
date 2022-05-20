# テーブル設計

## users テーブル
foreign_key: true
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| user_image         | string | null: false |
| introduction       | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           |integer | null: false |
| tel                |integer | null: false |


### Association

- has_many :items
- has_many :record

## items テーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user_id            | integer   | null: false,foreign_key: true|
| name               | string    | null: false,                 |
| price              | integer   | null: false                  |
| description        | string    | null: false                  |
| category           | string    | null: false                  |
| status             | string    | null: false                  |
| state              | string    | null: false                  |
| city               | string    | null: false                  |
| fee_payer          | integer   | null: false                  |
| delivery           | string    | null: false                  |
| delivery_time      | integer   | null: false                  |

### Association

- belongs_to :user
- belongs_to :record


## addressテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user_id            | integer   | null: false,foreign_key: true|
| family_name        | string    | null: false,                 |
| first_name         | string    | null: false                  |
| family_name_kana   | string    | null: false                  |
| first_name_kane    | string    | null: false                  |
| post_code          | string    | null: false                  |
| prefecture         | string    | null: false                  |
| city               | string    | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    | null: false                  |


### Association

- belongs_to :record

## recordテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| saler_id           | integer   | null: false,foreign_key: true|
| buyer_id           | integer   | null: false,foreign_key: true|

### Association
- belongs_to :items 
- belongs_to :user
