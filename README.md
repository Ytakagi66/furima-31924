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

| Column                | Type   | Options                   |
| ----------------------|------- | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last-name-kana        | string | null: false               |
| first-name-kana       | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| info         | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status       | string     | null: false                    |
| shipping_fee | string     | null: false                    |
| prefecture   | string     | null: false                    |
| scheduled    | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | string     | null: false                    |
| select-box   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone-number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |
### Association

- belongs_to :order