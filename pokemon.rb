class Pokemon
  include ActiveModel::Model
  attr_accessor :name, :type
  validates_presence_of :name
  # validates :name, presence: true
end