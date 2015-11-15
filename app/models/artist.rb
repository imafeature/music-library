class Artist < ActiveRecord::Base
	validates :name, presence: true
	validates :active_from, numericality: { only_integer: true, less_than_or_equal_to: 2015, greater_than_or_equal_to: 1900, :allow_blank => true }
	validates :active_until, numericality: { only_integer: true, less_than_or_equal_to: 2015, greater_than_or_equal_to: 1900, :allow_blank => true }
  
  belongs_to :label
  belongs_to :album

  #has_and_belongs_to_many :songs
  has_and_belongs_to_many :users, :albums
  accepts_nested_attributes_for :albums
end
