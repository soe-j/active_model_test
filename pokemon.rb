class Pokemon
  include ActiveModel::Model
  attr_accessor :name, :type

  # 検証の設定
  validates_presence_of :name
  validate do
    errors.add(:base, "Not Type class") unless @type.class == Type
  end

  # initializeされたら、その後に呼ぶ関数after_initailizeを宣言、定義
  define_model_callbacks :initialize, only: :after
  after_initialize :validate

  def initialize(args)
    run_callbacks(:initialize) { super }
  end

  def validate
    if self.invalid?
      raise "Pokemon format error"
    end
  end

  def attack
    puts "いけ!#{self.name}、#{self.type.get_skill}!!!"
  end
end