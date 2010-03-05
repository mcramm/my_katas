def confirm_collatz(num)
  count, str = 0, ""

  puts "Confirming for #{num}:\r\n"
  while num != 1 && count <= 5000
    
    if num%2 == 0
      num = num/2
    else
      num = (num*3) + 1
    end
    str << "#{num},"
    count += 1
  end
  puts str.chop!
  puts "\r\n\tWe got to 1!!\r\n" if num == 1
  puts "\tIt took: #{count} steps.\r\n\r\n"
end

confirm_collatz(100)
confirm_collatz(176)
confirm_collatz(500)
confirm_collatz(5000)