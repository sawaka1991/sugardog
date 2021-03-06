class Disc < ApplicationRecord

	has_many :songs
  	accepts_nested_attributes_for :songs, allow_destroy: true
	belongs_to :cd

	validates :disc_num, presence: true
end
