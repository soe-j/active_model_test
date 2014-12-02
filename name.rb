require './validational_model'
class Name < ValidationalModel

  attr_accessor :str
  validates_presence_of :str

end