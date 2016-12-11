#!/bin/bash

readonly MESSAGES=("Minor changes" "Refactoring" "Bug fixes" "Minor bug fix" 
				   "Major bug fix" "Ship new features" "Refactor main()" 
				   "Remove test code" "Fix tests" "Add some tests" 
				   "Expand test coverage" "Update readme")

main() {
	git config push.default current
	length="${#MESSAGES[@]}"
	while :
	do
		rand=$(( $RANDOM % $length ))
		message="${MESSAGES[$rand]}"
		git add .
		git commit -m "$message"
		sleep .1
	done
}

function ctrl_c() {
	git push
}

trap ctrl_c EXIT
main
