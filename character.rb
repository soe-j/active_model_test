require './validational_model'
class Character < ValidationalModel

  attr_accessor :species, :body
  validates_presence_of :species, :body

end