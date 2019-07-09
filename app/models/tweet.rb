class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 }
  validates :text, presence: true
  validates :user, presence: true
  validate :image_presence

  private

  def image_presence
    errors.add(:image) unless image.attached?
  end
end
