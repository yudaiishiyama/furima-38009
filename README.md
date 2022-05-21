# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | -----------             |
| nickname           | string | null: false             |
| email              | string | unique: true,null: false|
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| family_name_kana   | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |



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
| category_id        | integer   | null: false                  |
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
| post_code          | string    | null: false                  |
| state_id           | integer   | null: false                  |
| city               | integer   | null: false                  |
| address            | references| null: false,foreign_key: true|
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
- has_one: address