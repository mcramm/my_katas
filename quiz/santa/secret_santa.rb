class SecretSanta
  attr_accessor :people

  def initialize
    @people = []
  end
  
  def add(person)
    @people << Person.new(person)
  end
  
  def list
    @people.each do |p|
      p.display_info
    end
  end
  
  def size
    @people.size
  end
  
  def assign
    @people.randomize!
    asignees = @people.dup.reverse
    
    first, last = 0, (@people.size)-1
    @people.size == 3 ? oper = 1 :  oper = last
    
    while oper > 0
      if oper %2  # Odd
        asignees.swap!(last, last-1)
        last -= 1
      else        # Even
        asignees.swap!(first, first+1)
        first += 1
      end
      oper -= 1
    end
    
    @people.each_index do |i|
      @people[i].secret_santa = asignees[i]
    end
  end
  
  def display_asignees
    @people.each do |p|
      puts "#{p.first} #{p.last} Assigned to #{p.secret_santa.first} #{p.secret_santa.last}" if p.secret_santa
    end
  end
end