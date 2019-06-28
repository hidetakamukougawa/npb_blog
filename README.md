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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|text|text|null: false|
|user|references|foreign_key: true|
|team|references|foreign_key: true|

### Association
- has_many :comments
- belongs_to :user
- belongs_to :team

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|foreign_key: true|
|tweet|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet

## teamテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associationテーブル
- has_many :tweets
