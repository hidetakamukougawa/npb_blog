class Tweet < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  # validates :image, presence: true
  validate :image_presence

  private

  def image_presence
    errors.add(:image) unless image.attached?
  end
end
