class ValidationalModel
  include ActiveModel::Model

  # XMLの属性に設定する変数をhashで持つ
  attr_accessor :xml_attr

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

  # 必要ならto_hashはこちら
  def to_hash
    hash = {}
    p instance_variables
    # インスタンス変数のリストの後ろ2つ(activemodel由来の変数)を覗いて取得
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
    self_node = Nokogiri::XML::Node.new(self.class.to_s, xml)
    xml.add_child(self_node)
    unless @xml_attr.blank?
      @xml_attr.each do |key, value|
        self_node[key.to_s] = value
      end
    end
    self.add_xml_node(self_node)
    xml
  end

  def add_xml_node(self_node)
    # インスタンス変数のリストの後ろ2つ(activemodel由来の変数)を覗いて取得
    instance_variables[0..-3].each do |name|
      # nameはインスタンス変数のシンボル 例) :@attr
      unless name.to_s == "@xml_attr"
        child = instance_variable_get(name) # 変数の値を取得
        child_node = Nokogiri::XML::Node.new(child.class.to_s.tr("@",""), self_node)
        if child.class.superclass == ValidationalModel
          child.add_xml_node(child_node)
          unless child.xml_attr.blank?
            child.xml_attr.each do |k, v|
              child_node[k.to_s] = v
            end
          end
          self_node.add_child(child_node)
        else
          self_node.content = child
        end
      end
    end
  end

end