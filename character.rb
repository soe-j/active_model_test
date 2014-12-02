require './validational_model'
class Character < ValidationalModel

  attr_accessor :name, :body
  validates_presence_of :name, :body

end