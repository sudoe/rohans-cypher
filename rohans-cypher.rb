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



# methods

def help_page
    puts "This program takes the following arguments from the command line"
    puts ""
    puts ""
    puts "--encrypt <message> <encryption key>"
    puts "--decrypt <message> <encryption key>"
    puts ""
    puts ""
    puts "message and encryption key should have 'marks' around them"
    puts "for troubleshooting add -V as the second argument"
    puts "IE"
    puts "--encrypt -V <message> <encryption key>"
end
   
def chew(string)
    #this method takes a string and chews it into an array of strings
    string.is_a?(String) ? ord_all(string.split(//)) : (puts "Error - chew tried to chew an array : #{string}")
end

def unchew(string)
    #this option joins an array of characters
    chr_all(string).join
end

def ord_all(array_of_characters)
    array_of_ordinals = Array.new
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

def vomit(encrypted_string, password)
    digested_message = Array.new
    chewed_password = chew(password)
    encrypted_array = encrypted_string.to_a.to_i
    encrypted_array.size.times do |x|
        digested_message << encrypted_array[x].to_i / chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
    end
    return unchew(digested_message)
end

def digest_verbose(message, password)
    digested_message = Array.new
    puts "chewed_message"
    puts chewed_message = chew(message)
    puts "chewed_password"
    puts chewed_password = chew(password)
    puts "digesting now"
    message.size.times do |x|
        puts digested_message << chewed_message[x] * chewed_password[x % password.size] # <-- allows for messages longer then password
    end
    chewed_message = chew(message)
    chewed_password = chew(password)
    message.size.times do |x|
        digested_message << chewed_message[x] * chewed_password[x % password.size] # <-- allows for messages longer then password
    end
    return digested_message
end

def vomit_verbose(encrypted_array, password)
    puts encrypted_array
    digested_message = Array.new
    encrypted_array = encrypted_string.to_a.to_i
    puts "chewed_password"
    puts chewed_password = chew(password)
    puts "vomiting"
    #encrypted_array.size.times do |x|
    #    puts digested_message << encrypted_array[x].to_i / chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
    # end
    digested_message = Array.new
    chewed_password = chew(password)
    
    encrypted_array.size.times do |x|
        digested_message << encrypted_array[x].to_i / chewed_password[ x % password.size].to_i # <-- allows for messages longer then password
    end
    return unchew(digested_message)
end


def main
    if ARGV[0] == "--encrypt" #encrypt selector specified at command line
        if ARGV[1] == "-V" #verbose mode
            if ARGV[2].is_a?(String) && ARGV[3].is_a?(String)
                puts digest_verbose(ARGV[2], ARGV[3])
            else
                puts help_page
            end
        else
            if ARGV[1].is_a?(String) && ARGV[2].is_a?(String)
                puts digest(ARGV[1], ARGV[2])
                
                @@encrypted_message = digest(ARGV[1], ARGV[2])  #take out this line !!delete!!
            else
                puts help_page
            end

        end
    elsif ARGV[0] == "--decrypt" #decrypt selector specified at command line
        if ARGV[1] == "-V" # verbose mode
            if ARGV[2].is_a?(String) && ARGV[3].is_a?(String)
                puts vomit_verbose(ARGV[2], ARGV[3])
            else
                puts help_page
            end
        else
            if ARGV[1].is_a?(String) && ARGV[2].is_a?(String)
                puts vomit(ARGV[1], ARGV[2])
            else
                puts help_page
            end
        end
    else
        puts help_page
    end
end


#  main  # commented out for testing purposes

message = "stuff and things"
password = "mayhem and killing"


encrypted_message = digest(message, password)
print encrypted_message
puts ""

print encrypted_message.to_s
encrypted_message = encrypted_message.to_s
puts ""

array_ord = encrypted_message.split(',').each {|x| x.to_i}
print array_ord
puts ""
puts "oeu"
puts vomit(array_ord, password)   #just testing this stuff  !!delete!!
