# require "rexml/parsers/pullparser"
# require 'rexml/parsers/streamparser'
# require 'rexml/parsers/baseparser'
# require 'rexml/streamlistener'

class ValidationalModel
  include ActiveModel::Model
  include ActiveModel::Serializers::Xml
  include ActiveModel::Serializers::JSON

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

  def to_xml(options = {}, &block)
    xml = super
    # parser = REXML::Parsers::StreamParser.new(xml)
    # parser = REXML::Parsers::PullParser.new(xml)
    # str = ""
    # while parser.has_next?
    #   event = parser.pull
    #   if event.start_element?
    #     p event[0]
    #   end
    # end
    xml
  end
end