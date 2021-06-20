# テーブル設計

## users テーブル

| Column                          | Type   | Options                     |
| ------------------------------- | ------ | --------------------------- |
| nickname                        | string  | null: false                |
| email                           | string  | null: false, unique:: true |
| encrypted_password              | string  | null: false                |
| last_name                       | string  | null: false                |
| first_name                      | string  | null: false                |
| last_name_ka                    | string  | null: false                |
| first_name_ka                   | string  | null: false                |
| birthday                        | date    | null: false                |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_description  | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| delivery_price_id | integer    | null: false                    |
| delivery_day_id   | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| item_price        | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |         
| phone_number    | string     | null: false                    |
| purchase-history | references | null: false, foreign_key: true|

### Association

- belongs to :purchase_history


## purchase_hisrotys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- has_one :purchase