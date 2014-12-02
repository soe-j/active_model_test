require 'bundler'
Bundler.require

require './character'
require './pokemon'
require './type'
require './name'

I18n.enforce_available_locales = false

# begin
  p "nameもtype(クラス)も入ってる================"
  pipi = Pokemon.new(name: Name.new(str: "ピッピ", xml_attr: {en_str: "pipi"}), type: [Type.new(name: Name.new(str: "ノーマル"), xml_attr: {code: "normal"}), Type.new(name: Name.new(str: "みず"), xml_attr: {code: "water"})], xml_attr: {code: "1", status: "OK"} )
  str = ""
  pipi.type.each do |type|
    str << type.name.str
  end
  puts "名前は#{pipi.name.str}、#{str}ポケモンじゃ"
  pipi.attack

  p "characterつくっちゃう================"
  chara = Character.new(name: Name.new(str: "ポケモン"), body: pipi, xml_attr: {createdby: "satoshitajiri"})
  puts chara.to_hash
  puts chara.to_xml

  # p "nameもtype(クラスのnameがおかしい)も入ってる================"
  # pipi = Pokemon.new(name: "pipi", type: Type.new(name: "ののの"))
  # puts "名前は#{pipi.name}、#{pipi.type.name}ポケモンじゃ"
  # pipi.attack

  # p "name入ってない================="
  # noname = Pokemon.new(type: "みず")
  # puts "名前は#{noname.name}、#{noname.type.name}ポケモンじゃ"

  # p "nameもtype(文字)も入ってる================="
  # pika = Pokemon.new(name: "ピカチュウ", type: "でんき")
  # puts "名前は#{pika.name}、#{pika.type.name}ポケモンじゃ"

  # p "typeがない"
  # poka = Pokemon.new(name: "poka")


# rescue => ex
#   puts(ex.message)
# end

  # p "type入ってない================="
  # notype = Pokemon.new(name: "みゅーつーてきなやつ")
  # if notype.invalid?
  #   p notype.errors.full_messages
  # else
  #   puts "名前は#{notype.name}、#{notype.type.name}ポケモンじゃ"
  # end

  # p "typeがType class=============="
  # pikachu = Pokemon.new(name: "本物のぴかちゅう", type: Type.new(name: "でんき"))
  # if pikachu.invalid?
  #   p pikachu.errors.full_messages
  # else
  #   p pikachu.attack
  # end

  # p "typeが存在しないtype==========="
  # doraemon = Pokemon.new(name: "ドラえもん", type: Type.new(name: "ネコ型ロボット"))
  # if doraemon.invalid?
  #   p doraemon.errors.full_messages
  # else
  #   p doraemon.attack
  # end