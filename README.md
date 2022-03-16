IMPORTANT
	Back up all files before using.

NOTES
	Run 'chmod +x tagrep.sh' for execute permissions for this script.

NAME
	tagrep

SYNOPSIS
	tagrep   [ -p | --prompt ]
                 [ -t | --turbotrue ] 
                 [ -f | --turbofalse ]
                 [ -h | --help ]
                 [ -v | --version ]

DESCRIPTION
	Given a tag name, filepattern, a word/phrase to replace, and the replaced word/phrase
	all files that matches the regex filepattern from the root directory 
	(where the script is located) will be recursively piped to tagrep.

	tagrep then searches for all instances of <tag name> and </tag name> in each file,
	matches the first instance of the word/phrase to replace between the xml style tags
	(order from left to right and top to bottom of the file),
	and replaces it with the replaced word/phrase.

OPTIONS
	Generic Program Information
		-h, --help 
			Output a message and exit.

		-v, --version
			Output the version number of tagrep and exit.

	Generic Use
		-p, --prompt
			Prompts the user for tag

	Ranorex Turbo Mode
		-t, --turbotrue
			Turns on turbo mode for all *.rxrec files.

		-f, --turbofalse
			Turns off turbo mode for all *.rxrec files

EXAMPLE
	tag="turbo"
	filepattern="*.rxrec"
	phraseToReplace="False"
	replacementPhrase="True"

	InputFile: file1.rxrec
			<RandomTag>
				<turbo>
					garbageVal1=Color.Point.Red,
					False,
					anotherGarbageVal2=Sky.Blue
				</turbo> 
				<RandomTag2>
					Random2
				</RandomTag2>
			</RandomTag> EOF

	Output: file1.rxrec
			<RandomTag>
				<turbo>
					garbageVal1=Color.Point.Red,
					True,
					anotherGarbageVal2=Sky.Blue
				</turbo> 
				<RandomTag2>
					Random2
				</RandomTag2>
			</RandomTag> EOF

tagrep 1.0