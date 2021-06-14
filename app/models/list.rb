class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  belongs_to :users
  validates :name, presence: true, uniqueness: true
end
