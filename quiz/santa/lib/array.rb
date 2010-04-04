class Array
  def randomize
    orig, new_arr = self.dup, self.class.new
    new_arr << orig.slice!(rand(orig.size)) until
      new_arr.size.eql?(self.size)
      new_arr
    end

    def randomize!
      self.replace(randomize)
    end
    def swap!(elem1, elem2)
      self[elem1], self[elem2] = self[elem2], self[elem1]
    end
end