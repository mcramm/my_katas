class Encrypter
  def initialize(keystream)
    @keystream = keystream
  end
  
  def encrypt(s)
    process(s) {|c, k| correct(c + k)}
  end
  
  def decrypt(s)
    process(s) {|c, k| correct(c - k)}
  end
  

  private

  def process(s, &the_work)
    s = prepare(s)
    @key = @keystream.generate_keystream( s.length ) if @key.nil?
    s, k = str_to_num(s), str_to_num(@key)
    
    final_arr = [] 
    s.each_index do |i|
      final_arr[i] = the_work.call(s[i], k[i])
    end
    
    num_to_str(final_arr)
  end
  
  def prepare(s)
    s.upcase!
    s.gsub!(/[^A-Z]/, "")
    s << 'X'*((5-s.size)%5)%5
  end
  
  def str_to_num(str)
    arr = []
    str.each_byte do |b| 
      arr << (b - 64)
    end
    arr
  end
  
  def num_to_str(arr)
    str = ""
    arr.each do |b|
      str << (b + 64).chr
    end
    str
  end
  
  def correct(sum)
    return sum - 26 if sum > 26
    return sum + 26 if sum < 0
    return sum
  end
end