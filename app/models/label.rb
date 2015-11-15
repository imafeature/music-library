class Label < ActiveRecord::Base
  validates :name, presence: true
  has_many :users, :autosave => true
  has_many :albums, :autosave => true
  accepts_nested_attributes_for :albums	
end
