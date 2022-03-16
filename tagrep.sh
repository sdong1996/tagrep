#! /bin/bash

usage()
{
  echo "Usage: tagrep   [ -p | --prompt ] (default)
                [ -t | --turbotrue ] 
                [ -f | --turbofalse ]
                [ -h | --help ]
                [ -v | --version ]"
  exit 2
}

version()
{
  echo "tagrep 1.0"
  exit 2
}

getUserInput()
{
  echo "Find and replace patterns between two XML tags."
  echo "File pattern to look for? (eg '*.txt')"
  read filepattern
  echo "Tag name:"
  read tag
  echo "Replace string:"
  read replace
  echo "Replacement string:"
  read replacement
  echo "Replacing all occurences of $replace with $replacement in files matching $filepattern"
}

PARSED_ARGUMENTS=$(getopt -a -n tagrep -o ptfhv --long prompt,turbotrue,turbofalse,help,version -- "$@")
VALID_ARGUMENTS=$?
if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage
fi


eval set -- "$PARSED_ARGUMENTS"

case "$1" in
      -p | --prompt)  getUserInput
                  ;;
   -t | --turbotrue)  filepattern="*.rxrec"
                      tag="turbomode"
                      replace="False"
                      replacement="True"
                      ;;
  -f | --turbofalse)  filepattern="*.rxrec"
                      tag="turbomode"
                      replace="False"
                      replacement="True"
                      ;;
        -h | --help)  usage
                      ;;
     -v | --version)  version
                      ;;
                  *)  getUserInput
                      ;;
esac

# if no variables set, teach user how to use
if [ -z "$filepattern" ]; then
  usage
fi

startTag="<"$tag">"
endTag="</"$tag">"

echo "filepattern: $filepattern"
echo "tag name: $tag"
echo "replace: $replace"
echo "replacement: $replacement"

find . -type f -name $filepattern -print0 | xargs -0 \
sed -i -e ':a;N;$!ba; s|\('"$starTag"'.*\)'"$replace"'\(.*'"$endTag"'\)|\1'"$replacement"'\2|g'
