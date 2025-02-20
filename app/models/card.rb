class Card < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  #validates :timer, format: { with:  /\A(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/ }
  #validates :images, format: { with: /.(png|jpg|jpeg)$/, multiline: true }

  belongs_to :user
  belongs_to :collection, optional: true
  has_one :timer, dependent: :destroy
  has_many_attached :images, dependent: :destroy
end
