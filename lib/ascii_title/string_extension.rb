require 'ascii_title'

class String
	include AsciiTitle

	def ascii_title(fontFace)
		begin
			title = ''
			self.each_line do |text_line| 
				(1..fontFace.lines).each do |line|
					text_line.chomp.each_char do |character|
						if character == "\n"
							puts "newline"
						end
						
						begin
							title << fontFace.characterLine("char_#{character}", line - 1)
						rescue TypeError
							next
						end
					end
					title << "\n"
				end
			end
			
			return title
		rescue
			$stderr.puts "Something wrong with the font: #{fontFace.name}!"
		end
	end
end
