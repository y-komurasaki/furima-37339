# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false, unique: true |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | references          | null: false               |


### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| image                               | string     | null: false                    |
| name                                | text       | null: false                    |
| info                                | text       | null: false                    |
| price                               | text       | null: false                    |
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
| postcode           | string              | null: false, unique: true      |
| prefecture         | string              | null: false, unique: true      |
| city               | string              | null: false                    |
| block              | string              | null: false                    |
| building           | string              | null: false                    |
| phone_number       | string              | null: false                    |
| orders             | references          | null: false, foreign_key: true |

- belongs_to :order


