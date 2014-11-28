require './validational_model'
class Character < ValidationalModel

  attr_accessor :species, :body
  validates_presence_of :species, :body

  def to_xml
    xml_object = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.character {
        xml.species @species
        xml.body @body
      }
    end
    xml_object.to_xml
  end
end