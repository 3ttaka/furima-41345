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
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null:false  | 

### Association

- has_many :items
- has_many :comments
- has_one :delivery 

## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| item_image           | string  | null: false |
| item_name            | string  | null: false |
| item_description     | text    | null: false |
| item_category        | string  | null: false |
| item_condition       | string  | null: false |
| shopping_fee_bearer  | string  | null: false |
| shopping_origin_area | string  | null: false |
| shopping_days        | string  | null: false |
| item_price           | integer | null: false | 

### Association

- has_many :comments
- belongs_to :user

## deliveries テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_code   | integer    | null: false  |
| prefecture    | string     | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     | null: false  |
| phone_number  | integer    | null: false  |

### Association

- belongs_to :user

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_content | string     | null: false                    |


### Association

- belongs_to :user
- belongs_to :items
