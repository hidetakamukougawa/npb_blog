# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :text, presence: true
  validates :user, presence: true
  validates :tweet, presence: true
end
