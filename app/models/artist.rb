class Artist < ActiveRecord::Base
	validates :name, presence: true
	#validates :active_from, numericality: { only_integer: true, less_than_or_equal_to: 9999, greater_than_or_equal_to: 1000 }	
	#validates :active_until, numericality: { only_integer: true, less_than_or_equal_to: 9999, greater_than_or_equal_to: 1000 }	
  
  belongs_to :label
  belongs_to :album

  #has_and_belongs_to_many :songs
  has_and_belongs_to_many :albums
  accepts_nested_attributes_for :albums
end
