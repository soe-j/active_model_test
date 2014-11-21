require 'bundler'
Bundler.require

require './pokemon'


p "nameもtypeも入ってる================="
pika = Pokemon.new(name: "ピカチュウ", type: "でんき")
if pika.invalid?
  p pika.errors.full_messages
else
  puts "名前は#{pika.name}、#{pika.type}ポケモンじゃ"
end

p "name入ってない================="
noname = Pokemon.new(type: "みず")
if noname.invalid?
  p noname.errors.full_messages
else
  puts "名前は#{noname.name}、#{noname.type}ポケモンじゃ"
end

p "type入ってない================="
notype = Pokemon.new(name: "みゅーつーてきなやつ")
if notype.invalid?
  p notype.errors.full_messages
else
  puts "名前は#{notype.name}、#{notype.type}ポケモンじゃ"
end