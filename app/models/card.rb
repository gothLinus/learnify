class Card < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  has_one :time, dependent: :destroy
  has_many :file, dependent: :destroy
end