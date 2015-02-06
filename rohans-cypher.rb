# rohans-cypher is an encryption program in pre-alpha and should be considered experimental in nature Copyright (C) 2015  Jeremy Benz

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.

p   "rohans-cypher  Copyright (C) 2015  Jeremy Benz"
p   "This program comes with ABSOLUTELY NO WARRANTY."
p   "This is free software, and you are welcome to redistribute it"
p   "under certain conditions."

#methods used
def chew(string, chew)
    array = []
    if chew == true
        string.size.times do |x|
            array << string[x].ord.to_i
        end
        return array
    elsif chew == false
        spit = []
        string.size.times do |x|
            spit << string[x].chr.to_s
        end
        return spit    
    end
end


def digest(message, password)
    chewed_message = chew(message, true)
    chewed_password = chew(password, true)
    digested_message = []
    frame = 0
    message.size.times do |x|
        frame = chewed_message[x].to_i + chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
        digested_message << frame
    end
    return digested_message
end

def uncrypt(message, password)
    chewed_password = chew(password, true)
    digested_message = []
    frame = 0
    message.size.times do |x|
        frame = message[x].to_i - chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
        digested_message << frame
        end
    return chew(digested_message, false)
end

def feed_baby_birds(array)
    output = ""
    array.size.times do |x|
        output[x] = array[x].to_s
    end
    return output
end



message = ""
until message != ""
    puts "please, enter a message you would like to encrypt"
    message = gets.chomp
end


password = ""
until password != ""
    puts "please, enter a password"
    password = gets.chomp
end

#chewed_message = chew(message, true)
spit_message = chew(message, false)
digested_message = digest(message, password)



#  monolog with user
    system('sleep 0.5')
    system('clear')
    puts "hamster pre-workout streching"
    system('sleep 0.5')
    system('clear')
    puts "hamster in hamster wheel"
    system('sleep 0.5')
    system('clear')
    print "hamster running"
    
    
    
# a curio for the lolz
    puts "!"
    5.times do |x|
    

        print "+"
        system('sleep 0.5')
    end
    system('sleep 0.5')
    system('clear')
puts "was your message, '#{(feed_baby_birds(uncrypt(digested_message, password)))}'?"
