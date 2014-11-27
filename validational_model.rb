class ValidationalModel
  include ActiveModel::Model
  include ActiveModel::Serializers::Xml
  # initializeされたら、その後に呼ぶ関数after_initailizeを宣言、定義
  define_model_callbacks :initialize, only: :after
  after_initialize :validate

  # callback発動するようオーバーライド
  def initialize(args)
    run_callbacks(:initialize) { super }
  end

  def validate
    if self.invalid?
      raise "#{self.class} format error"
    end
  end

  def attributes
    hash = {}
    # instance_variables(インスタンス変数一覧)から、active_modelが使うvalidation_contextとerrorsを除くため、後ろ2つ除外
    instance_variables[0..-3].each do |name|
      key = name.to_s.tr("@", "")
      hash[key] = instance_variable_get(name)
    end
    hash
  end
end