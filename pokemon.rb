require './validational_model'
class Pokemon < ValidationalModel

  attr_accessor :name, :type

  # 検証の設定
  validates_presence_of :name
  validate do
    errors.add(:base, "Not Type class") unless @type.class == Type
  end

  def attack
    puts "いけ!#{self.name}、#{self.type.get_skill}!!!"
  end
end