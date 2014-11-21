class Pokemon
  include ActiveModel::Model
  attr_accessor :name, :type

  validates_presence_of :name, :type
  validate do
    if self.type.class != Type
      errors.add(:type, "is not Type class")
    elsif self.type.invalid?
      errors.add(:type, "is おかしい Type")
    end
  end # これでtypeのpresenceが上書きされている感

  def attack
    if self.type.invalid?
      p "だめやん"
    else
      "いけ!#{self.name}、#{self.type.get_skill}!!!"
    end
  end
end