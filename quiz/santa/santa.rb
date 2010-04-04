require 'secret_santa'
require 'lib/person'
require 'lib/array'
s = SecretSanta.new
result = ""
while result != "\n"
  puts
  puts "Please enter a person's info. The format is FIRST_NAME LAST_NAME <EMAIL>"
  puts "Hit enter to stop and assign secret santas."
  result = STDIN.readline()
  s.add result if result != "\n"
  if s.size < 3 && result == "\n"
    puts "Sorry, that wasn't enough people. Hit CTRL-C if you want to quit."
    result = ""
  end
end

# s.add "mike cramm <gmcramm@gmail.com>" ## For Testing
# s.add "another dude <another@gmail.com>"
# s.add "santa clause <santa@live.com>"
# s.add "elf one <elf.one@live.com>"
# s.add "elf two <elf.two@live.com>"
# s.add "elf three <elf.three@live.com>"
# s.add "elf four <elf.four@live.com>"

s.assign

s.display_asignees