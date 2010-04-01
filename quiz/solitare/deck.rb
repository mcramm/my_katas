class Deck
  def initialize
    @deck = (1..52).to_a << 'A' << 'B'
  end
  
  def shuffle(init, method = :fisher_yates)
    srand( init )
    self.send( method.id2name + "_shuffle", @deck )
  end
  
  def flip(num = 1)
    if num >1
      puts @deck[0..num-1]
    else
      puts @deck[0]
    end
  end
  
  def move_a
    move_down( @deck.index('A') )
  end
  
  def move_b
    2.times{ move_down( @deck.index('B') ) }
  end

  def triple_cut
    #all cards above top joker move below the bottom joker
    #all cards below bottom joker above the top joker
    topj =  (@deck.index('A') < @deck.index('B') ? @deck.index('A') : @deck.index('B'))
    botj =  (@deck.index('A') > @deck.index('B') ? @deck.index('A') : @deck.index('B'))
    
    cards_above = @deck[0..topj-1]
    cards_below = @deck[botj+1..@deck.length-1]
    
    @deck.replace([cards_below, @deck[topj..botj], cards_above].flatten)
    
  end
  
  def count_cut
    top_cards = @deck[0..@deck.last]
    @deck[0..@deck.last] = []
    @deck.replace([@deck[0..@deck.length-2],top_cards, @deck.last].flatten)
  end

  def output_letter
    first = @deck.first
    first = 53 if first.instance_of? String
    letter = @deck[first-1]
    if letter.instance_of? String
      nil
    else
      letter -= 26 if letter > 26
      letter += 64
      letter.chr
    end
  end
  
  private
  
  # From pleac.sf.net
  def fisher_yates_shuffle( a )
    (a.size-1).downto(0) { |i|
      j = rand(i+1)
      a[i], a[j] = a[j], a[i] if i != j
    }
  end

  # From pleac.sf.net
  def naive_shuffle( a )
    for i in 0...a.size
      j = rand(a.size)
      a[i], a[j] = a[j], a[i]
    end
  end
  
  def move_down( card_index )
    if card_index == @deck.length - 1  #if card is on the bottom
      @deck[1..1] = @deck[1], @deck[card_index] #move to just below the top card
      @deck.pop #remove the last card
    else
      @deck[card_index], @deck[card_index+1] = @deck[card_index+1], @deck[card_index] #swap the card with the one below it
    end
  end
 
end

