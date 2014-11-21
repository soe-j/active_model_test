class Pokemon
  include ActiveModel::Model
  attr_accessor :name, :type
  validates_presence_of :name, :type
  validate do
    unless self.type.class == Type
      errors.add(:type, "is not Type class")
    end
  end # これでtypeのpresenceが上書きされている感

  # validates :name, presence: true

  def attack
    "いけ!#{self.name}、#{self.type.get_skill}!!!"
  end
end