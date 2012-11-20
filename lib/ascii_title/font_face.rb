module AsciiTitle

	class FontFace
		attr_accessor :characters, :name, :info, :lines
		def initialize(name, info, lines, uppercase, lowercase, numbers, specials)
			@characters, @name, @info, @lines, @types = Hash.new, name, info, lines, {:uppercase => uppercase, :lowercase => lowercase, :numbers => numbers, :specials => specials}
		end
	
		def addCharacter(character)
			@characters[character.name.to_sym] = character.lines
		end
	
		def isTypeEnabled(type)
			if @types[type.to_sym]
				return true
			else
				return false
			end
		end
	
		def characterLine(character_name, line)
			begin
				return @characters[character_name.to_sym][line]
			rescue
				puts "No character called #{character_name}!"
			end
		end
	end

	class Character
		attr_accessor :name, :lines
		def initialize(name)
			@name, @lines = name, Array.new
		end
	
		def addLine(line)
			@lines.push(line)
		end
	end
end

