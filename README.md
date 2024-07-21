# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null:false  |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :delivery 
- has_many :order_histories

## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| item_name               | string     | null: false |
| item_description        | text       | null: false |
| item_category_id        | integer    | null: false |
| item_condition_id       | integer    | null: false |
| shopping_fee_bearer_id  | integer    | null: false |
| prefecture_id           | integer    | null: false |
| shopping_days_id        | integer    | null: false |
| item_price              | integer    | null: false | 
| user                    | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :order_history

## deliveries テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_code   | string     | null: false  |
| prefecture_id | string     | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone_number  | string     | null: false  |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :order_history

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_content | string     | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

## order_histories テーブル


| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery
