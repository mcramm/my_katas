class Person
  attr_accessor :first, :last, :email, :secret_santa
  
  def initialize(str)
    a = str.split(' ')
    @first, @last, @email = a if validate(a)
    @secret_santa = nil
  end
  
  def display_info
    puts "#{@first} #{@last}\t #{@email}"
  end

  private
  def validate(a)
    raise "The format is FIRST_NAME LAST_NAME <EMAIL>" if a.length != 3
    if !validate_email(a[2])
      raise "The supplied email is invalid."
    end
    
    return true
  end
  
  def validate_email(email)
    return true if email.match(/<([a-zA-Z0-9])+(\.)*([a-zA-Z0-9])+@([a-zA-Z0-9])+.com>/)
  end
end



