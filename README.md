# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| date               |integer | null: false |



### Association

- has_many :items
- has_many :records

## items テーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user               | references| null: false,foreign_key: true|
| name               | string    | null: false,                 |
| price              | integer   | null: false                  |
| description_id     | text      | null: false                  |
| status_id          | integer   | null: false                  |
| state_id           | integer   | null: false                  |
| fee_payer_id       | integer   | null: false                  |
| delivery_time_id   | integer   | null: false                  |

### Association

- belongs_to :user
- has_one :record


## addressesテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| post_code          | integer   | null: false                  |
| state_id           | integer   | null: false                  |
| city               | integer   | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    |                              |
| tel                | string    | null: false                  |


### Association

- belongs_to :record

## recordsテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user               | references| null: false,foreign_key: true|
| itme               | references| null: false,foreign_key: true|

### Association
- belongs_to :item 
- belongs_to :user
- belongs_to :address