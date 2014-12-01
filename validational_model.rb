class ValidationalModel
  include ActiveModel::Model
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

  # 必要ならto_hash
  def to_hash
    hash = {}
    # instance_variables(インスタンス変数一覧)から、active_modelが使うvalidation_contextとerrorsを除くため、後ろ2つ除外
    instance_variables[0..-3].each do |name|
      key = name.to_s.tr("@", "")
      value = instance_variable_get(name)
      value = value.to_hash if value.class.superclass == ValidationalModel
      hash[key] = value
    end
    hash
  end
end