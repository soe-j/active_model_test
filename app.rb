require 'bundler'
Bundler.require

require './pokemon'
require './type'

I18n.enforce_available_locales = false

p "nameもtype(文字)も入ってる================="
pika = Pokemon.new(name: "ピカチュウ", type: "でんき")
if pika.invalid?
  p pika.errors.full_messages
else
  puts "名前は#{pika.name}、#{pika.type.name}ポケモンじゃ"
end

p "name入ってない================="
noname = Pokemon.new(type: "みず")
if noname.invalid?
  p noname.errors.full_messages
else
  puts "名前は#{noname.name}、#{noname.type.name}ポケモンじゃ"
end

p "type入ってない================="
notype = Pokemon.new(name: "みゅーつーてきなやつ")
if notype.invalid?
  p notype.errors.full_messages
else
  puts "名前は#{notype.name}、#{notype.type.name}ポケモンじゃ"
end

p "typeがType class=============="
pikachu = Pokemon.new(name: "本物のぴかちゅう", type: Type.new(name: "でんき"))
if pikachu.invalid?
  p pikachu.errors.full_messages
else
  p pikachu.attack
end

p "typeが存在しないtype==========="
doraemon = Pokemon.new(name: "ドラえもん", type: Type.new(name: "ネコ型ロボット"))
if doraemon.invalid?
  p doraemon.errors.full_messages
else
  p doraemon.attack
end