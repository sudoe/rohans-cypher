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

def split(string, split = true)
    #this method takes a string and splits it into an array of strings
    if split
        string.split(//).each { |x|   x.ord }
    elsif !split
        message = ""
        #this option joins an array of characters
        return string.is_a?(Array) ? (string.each { |x|  message << x.chr }).join : (puts "error - tried to unsplit a string")
    end
end

#puts split("hello")
puts split(split("hello"), false)

