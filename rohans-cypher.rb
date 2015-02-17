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

message = ARGV[1]
password = ARGV[2]
option = ARGV[0]

# methods

def chew(string)
    #this method takes a string and chews it into an array of strings
    string.is_a?(String) ? ord_all(string.split(//)) : (puts "Error - chew tried to chew an array : #{string}")
end

def unchew(string)
    #this option joins an array of characters
    chr_all(string).join
end

def ord_all(array_of_characters)
    array_of_ordinals = []
    array_of_characters.size.times do |x|
        array_of_ordinals << array_of_characters[x].ord
    end
    return array_of_ordinals
end

def chr_all(array_of_ordinals)
    array_of_characters = []
    array_of_ordinals.size.times do |x|
        array_of_characters << array_of_ordinals[x].chr
    end
    return array_of_characters
end
    
def digest(message, password)
    digested_message = Array.new
    chewed_message = chew(message)
    chewed_password = chew(password)
    message.size.times do |x|
        digested_message << chewed_message[x] * chewed_password[x % password.size] # <-- allows for messages longer then password
    end
    return digested_message
end

def uncrypt(encrypted_array, password)
    digested_message = Array.new
    chewed_password = chew(password)
    
    encrypted_array.size.times do |x|
        digested_message << encrypted_array[x].to_i / chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
    end
    return unchew(digested_message)
end

def main(*ARGV)
    if ARGV[0][0..1] == "--"
        #add command line switches
        
        #to open a file
        system('touch message')
        encrypted_message = File.open("message", "r+") do |file|
            file.puts digest(message, password)
        end
    else
        #puts help file
    end
end
        
        


# puts digest(message, password)
# puts chew("hello")
# puts unchew(chew("hello"))
# puts digest("hello", "world")
# puts uncrypt(digest(message, password), password)

puts encrypted_message.class
puts encrypted_message.methods.sort
