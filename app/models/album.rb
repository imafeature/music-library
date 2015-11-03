class Album < ActiveRecord::Base
	validates :title, presence: true
	validates :genre, :format => {:with => %r{^[a-zA-Z]+$}, :multiline => true, :message => ' can consist only of alphabetic characters'}, :allow_blank => true
		
	validates :year, numericality: { only_integer: true, less_than_or_equal_to: 2015, greater_than_or_equal_to: 1900, :allow_blank => true }
	
	belongs_to :label, :autosave => true 
	belongs_to :artist, :autosave => true

	#has_and_belongs_to_many :songs
	has_and_belongs_to_many :artists, :autosave => true 

	accepts_nested_attributes_for :artist, :artists, :label#, :songs
end
