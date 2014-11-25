class Type
  include ActiveModel::Model

  attr_accessor :name

  # typeとskillの対応表
  type_list = %w(ノーマル ほのお みず でんき くさ こおり)
  skill_list = %w(ぱんち ほのおのぱんち みずでっぽう 10万ボルト はっぱカッター アイスノン)
  @@type_skill_list = {}
  type_list.each_with_index do |type,i|
    @@type_skill_list["#{type}"] = skill_list[i]
  end

  # 検証の設定
  validates_inclusion_of :name, in: type_list

  # initializeが呼ばれたら、その後に呼ぶ関数after_initializeを宣言、定義
  define_model_callbacks :initialize, only: :after
  after_initialize :validate

  def initialize(args)
    run_callbacks(:initialize) { super }
  end

  def validate
    if self.invalid?
      raise "Type format error"
    end
  end

  def get_skill
    @@type_skill_list["#{@name}"]
  end
end