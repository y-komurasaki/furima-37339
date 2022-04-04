# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false, unique: true |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |


### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| info                                | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| item_status_id                      | integer    | null: false                    |
| sipping_cost_id                     | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| sipping_date_id                     | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| postcode           | string              | null: false                    |
| prefecture_id      | integer             | null: false                    |
| city               | string              | null: false                    |
| block              | string              | null: false                    |
| building           | string              |                                |
| phone_number       | string              | null: false                    |
| order              | references          | null: false, foreign_key: true |

- belongs_to :order


