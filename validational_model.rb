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

  def to_xml
    xml = Nokogiri::XML("root", nil, 'utf-8')
    self_node = Nokogiri::XML::Node.new(self.class.to_s.downcase, xml)
    xml.add_child(self_node)
    self.to_xml_node(self_node)
    xml
  end

  def to_xml_node(self_node)
    # インスタンス変数のリストの後ろ2つ(activemodel由来の変数)を覗いて取得
    instance_variables[0..-3].each do |name|
      # nameはインスタンス変数のシンボル 例) :@attr
      child_node = Nokogiri::XML::Node.new(name.to_s.tr("@","").downcase, self_node)
      value = instance_variable_get(name) # 変数の値を取得
      if value.class.superclass == ValidationalModel
        child_node = value.to_xml_node(child_node)
      else
        child_node.content = value
      end
      self_node.add_child(child_node)
    end
    self_node
  end

end