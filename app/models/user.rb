class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :bookings
  has_one_attached :image

  def self.search(search)
    if search != ""
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
