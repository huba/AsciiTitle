# AsciiTitle

* Author: Huba Z. Nagy 
* Copyright(c) 2012 Huba Z. Nagy
* Released under the MIT Licence

AsciiTitle is a toolkit for turning ordinary ruby strings into exciting Ascii art. It is
a complete rewrite of [PyAsciiArt](http://github.com/huba/PyAsciiArt). Although it has less
functionalities for example there are no text boxes or builtin fonts yet.

[![Build Status](https://travis-ci.org/huba/AsciiTitle.png)](https://travis-ci.org/huba/AsciiTitle)

## Features

* Adds new method to the String class which turns the string into ascii art.
* New font styles can be described in xml.
* Only uses standard ruby libraries, so no dependencies to worry about (although
rake and bundler are useful for building the gem).

## Desired Features

* Text boxes.
* Support for "\t" character.

## Installation

Add this line to your application's Gemfile:

    gem 'ascii_title'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ascii_title

## Usage

### Adding new Fonts

Adding fonts is simple, all the characters are placed into
an .xml file as seen below. The font style is 
divided up into four zones plus one only for space,
four zones are:

* uppercase : A,  B, C ...
* lowercase : a, b, c ...
* numbers : 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
* specials : +, =, ! ...

```xml
<font>
	<info>
		<lines>10</lines><!--The height of the characters-->
		<name>Font Name</name>
		<description>A pretty cool font to use.</description>
		<uppercase>false</uppercase><!--if there is an uppercase field or should the program just skip it-->
		<lowercase>false</lowercase><!--same with lowercase and so on-->
		<numbers>false</numbers>
		<specials>false</specials>
		<missing_upper><!--if you want the program to read the field but there are a few characters missing still-->
			<miss>char_A</miss><!--put the character id in here, put all of them into the appropriate field-->
		</missing_upper>
		<missing_lower>
		</missing_lower>
		<missing_num>
		</missing_num>
		<missing_spec>
		</missing_spec>
	</info>
	<space><!--field tag-->
		<char><!--character tag, one for each character in the field make sure you put each character into the right field-->
			<char_id>char_space</char_id><!--char id follow the pattern: char_A, char_a, char_4...-->
			<ln></ln><!--fill out each row of the character-->
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
			<ln></ln>
		</char>
	</space>
```
and so on... Save it as whatever.xml.

### Using the Fonts

```ruby
	require "ascii_title"
	include AsciiTitle
	
	#load the font style from your xml
	fontFace = FontFaceUtils.loadXml("/wherever/you/saved/the/font_description.xml")

	#use the font face by passing it to the ascii_title method of the String class
	puts "Hello\nWorld".ascii_title(fontFace)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##License

Copyright (c) 2012 Huba Nagy

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
