#!/usr/bin/env ruby

file_name = "./assets/theme/js/script.js"

text = File.read(file_name)
blacklisted_text = File.read("blacklist.txt").split("\n")

blacklisted_text.each do |blacklisted_text|
  text.gsub!(blacklisted_text, "")
end

# Insert an early return in the script that Mobirise generates so that
# hidden sections with links are not included in any pages.
# The actual js_code might change in the
# future versions of Mobirise
js_code = 'var a=document.createElement("section");a.id="top-1"'
text.gsub!(js_code, "return false;" + js_code)

File.open(file_name, "w") { |file| file.puts text }
