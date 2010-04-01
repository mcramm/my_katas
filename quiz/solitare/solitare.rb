require 'deck'
require 'encrypter'
class Keystream
  def initialize(deck)
    @deck = deck
  end

  def generate_keystream(length)
    deck = @deck.dup
    result = []
    while result.length != length
      deck.move_a
      deck.move_b
      deck.triple_cut
      deck.count_cut
      letter = deck.output_letter
      result << letter unless letter.nil?
    end
    result.join
  end
end

@deck = Deck.new
@deck.shuffle(4)
@keystream = Keystream.new(@deck)

message = "God damn I love ruby. I know other languages can do this but DAMN"

enc = Encrypter.new(@keystream)
puts "Your message:\t\t#{message}"
encrypted = enc.encrypt(message)
puts "Encrypted:\t\t#{encrypted}"
puts "Aaaaand Decoded:\t#{enc.decrypt(encrypted)}"
puts
puts "Did it work?"
