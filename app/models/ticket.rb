class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :description, :title

  validates :title, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }
  #creates the "Title (and Description) can't be blank" errors
  #could also be
  #validates :title, :description, :presence => true

end
