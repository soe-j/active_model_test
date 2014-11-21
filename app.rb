require 'bundler'
Bundler.require

require './pokemon'

# begin
  pika = Pokemon.new(name: "ピカチュウ", type: "でんき")
  puts "名前は#{pika.name}、#{pika.type}ポケモンじゃ"

  nazo = Pokemon.new()
  puts "名前は#{nazo.name}、#{nazo.type}ポケモンじゃ"

  notype = Pokemon.new(name: "みゅーつーてきなやつ")
  puts "名前は#{notype.name}、#{notype.type}ポケモンじゃ"

# rescue => ex
#   puts ex.message
# ensure


# end