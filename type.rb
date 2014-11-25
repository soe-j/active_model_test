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

  validates_presence_of :name, in: type_list

  def get_skill
    @@type_skill_list["#{self.name}"]
  end
end