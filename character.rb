require './validational_model'
class Character < ValidationalModel

  attr_accessor :species, :body

  validates_presence_of :species, :body

  def attributes
    { 'species' => @species, 'body' => @body }
  end
end