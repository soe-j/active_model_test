require './validational_model'
class Character < ValidationalModel

  attr_accessor :species, :body
  validates_presence_of :species, :body

  def attributes
    hash = {}
    # instance_variables(インスタンス変数一覧)から、active_modelが使うvalidation_contextとerrorsを除くため、後ろ2つ除外
    instance_variables[0..-3].each do |name|
      key = name.to_s.tr("@", "")
      hash[key] = instance_variable_get(name)
    end
    hash
  end

  def to_xml
    xml_object = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.character {
        attributes.each do |key, value|
          eval("xml.#{key} value")
        end
      }
    end
    xml_object.to_xml
  end
end