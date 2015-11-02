class Album < ActiveRecord::Base
	validates :title, presence: true
	validates :year, numericality: { only_integer: true, less_than_or_equal_to: 9999, greater_than_or_equal_to: 1000 }
	
	belongs_to :label, :autosave => true 

	#has_and_belongs_to_many :songs
	has_and_belongs_to_many :artists

	accepts_nested_attributes_for :artists, :label#, :songs
end
