﻿# Require -Version 2.0

# This is just a quick script with some things for fun display.

# Utility Chars
[char] $lf = 10
[char] $cr = 13
[char] $sp = 32

# Fun Chars
if ($BasicSymbols) { 
    [char] $ch = 0x221a     # a square root
    [char] $ex = 0x00d7     # a light multiplication
    [char] $angle = 0x221F  # a right angle
} 
else { 
    [char] $ch = 0x2714     # heavy check
    [char] $ex = 0x2716     # heavy multiply
    [char] $angle = 0x2220  # an acute angle
}

$DisplayLoaded = $true

#__END__
