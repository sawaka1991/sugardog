class Song < ApplicationRecord
	belongs_to :disc
	belongs_to :singer

	validates :song_name, :song_kana_name, :order_num, :minutes, presence: true
end
