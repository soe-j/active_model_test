require './validational_model'
class Pokemon < ValidationalModel

  attr_accessor :name, :type

  # 検証の設定
  validates_presence_of :name
  validate do
    errors.add(:base, "Not Type class") unless @type.class == Type # || @type.class == Array && @type[0].class == Type
  end

  def attack
    puts "いけ!#{self.name.str}、#{self.type.get_skill}!!!"
  end
end