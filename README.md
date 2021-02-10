# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ----------------------|------- | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| name_kana             | string | null: false |
| birthday              | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| item_name    | string     | null: false                    |
| info         | string     | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| shipping_fee | string     | null: false                    |
| prefecture   | string     | null: false                    |
| scheduled    | string     | null: false                    |
| price        | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | string     | null: false                    |
| card-exp       | string     | null: false                    |
| card_cvc       | string     | null: false                    |
| securrity_code | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shippings

## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | string     | null: false                    |
| select-box   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | string     | null: false                    |
| order_id     | references | null: false, foreign_key: true |
### Association

- belongs_to :order