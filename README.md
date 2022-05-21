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
| description        | text      | null: false                  |
| status             | integer   | null: false                  |
| state_id           | integer   | null: false                  |
| city_id            | integer   | null: false                  |
| fee_payer          | integer   | null: false                  |
| delivery           | integer   | null: false                  |
| delivery_time      | integer   | null: false                  |

### Association

- belongs_to :user
- has_one :record


## addressesテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user               | references| null: false,foreign_key: true|
| post_code          | integer   | null: false                  |
| state_id           | integer   | null: false                  |
| city_id            | integer   | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    |                              |
| tel                | integer   | null: false                            |


### Association

- belongs_to :record

## recordsテーブル
| Column             | Type      | Options                      |
| ------------------ | ------    | -----------------------------|
| user               | references| null: false,foreign_key: true|
| itme               | references| null: false,foreign_key: true|

### Association
- has_one    :item 
- belongs_to :user
- belongs_to :address