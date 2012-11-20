module AsciiTitle
	module MiscUtils
		def MiscUtils.evaluateBoolean(text)
			if text.upcase == 'TRUE'
				return true
			elsif text.upcase == 'FALSE'
				return false
			else
				return nil
			end
		end
	end
	
	module FontFaceUtils
		require 'rexml/document'
		require 'ascii_title/font_face'
		include REXML
	
		def FontFaceUtils.loadXml(path)
			begin
				doc = Document.new File.new(path)
			
				info = doc.elements['Font/info']
				fontFace = FontFace.new(
					info.elements['name'].text,
					info.elements['description'].text,
					Integer(info.elements['lines'].text),
					MiscUtils.evaluateBoolean(info.elements['uppercase'].text),
					MiscUtils.evaluateBoolean(info.elements['lowercase'].text),
					MiscUtils.evaluateBoolean(info.elements['numbers'].text),
					MiscUtils.evaluateBoolean(info.elements['specials'].text)
				)
			
				doc.elements.each('Font/*') do |section|
					if section.name == 'info'
						next
					elsif section.name == 'space'
						fontFace.addCharacter(characterFromElement(section.elements['char']))
					else
						if fontFace.isTypeEnabled(section.name)
							section.elements.each('char') do |element|
								fontFace.addCharacter(characterFromElement(element))
							end
						end
					end
				end
			
				return fontFace
			rescue
				puts 'Some error happened!'
			end
		end
	
		def FontFaceUtils.characterFromElement(char_element)
			if char_element.name == 'char'
				character = Character.new(char_element.elements['char_id'].text)
				char_element.elements.each('ln') do |element|
					character.addLine(element.text)
				end
				return character
			else
				puts 'Element is not defining a character.'
			end
		end
	end
end
