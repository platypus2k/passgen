# A simple password generator written in Bash.
Its purpose is to generate safe, usable passwords for different services online. You have to remeber them, or store them safely somewhere.

	Usage: passgen [OPTION] [LENGTH]
	Default length is 10, but 4 for digits
	-d, --pin     for digits only; useful for generating PIN or similar
	-c, --letter  for letters only, both UPPER- and lowercase
	-p, --pass    for digits, letters and special characters !@#$%&

Using /dev/urandom as RNG, should be secure enough for most purposes.  
Using tr to filter out the characters we want.  
Using head for the number of chars we want to output.
