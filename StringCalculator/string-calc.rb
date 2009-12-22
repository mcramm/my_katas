def add(str)
  if str[0..1] == '//'    ## Checking for custom delimiters (Step 4.1)
    delim=str.split(/[\n]/).first 
    str = str[delim.length..-1]   # Remove deliniators from string (part of Step 7)
    delim = delim[2..-1]  # Remove the '//' from delim string Step 7
  end
  
  return '0' if str.nil?  ## Step 1
  delim ? numbers = str.split("#{delim}").map : numbers = str.split(/[\s,\n]/).map ## Split with custom delim if present, otherwise, with spaces/commas Step 1, 2, 3 ,4
  
  return "Too Many Nubmers" if numbers.length > 3
  
  sum = 0.0
  negNums = "There are Negative numbers in your string! -- The numbers are:"
  negatives = false
  numbers.each do |num| 
    if num.to_i < 0 || negatives  ## checking for negatives flag Step 5
      negNums << num  # concat to error string
      negatives = true  #set negatives flag
    else
      sum += num.to_f if num.to_f < 1001  ## Add the numbers to running sum Step 1, convert to float Step 6, Unless its over 1000, Step 10
    end
  end

  negatives == true ? (return negNums) : (return sum.to_s)  # Print negative string or sum 
end

puts add("//****\n 1.5      ****998 ****6")