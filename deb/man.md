% ECHOLOR(1) Abuseipdb Client User Manuals
% Kristuff 
% January 14, 2022

# NAME

echolor - A simple bash colorized echo function.

# SYNOPSIS

echolor *TEXT* [*OPTIONS*]

# DESCRIPTION

**echolor** is a simple bash echo colorized function.

# OPTIONS

-c *COLOR*, \--color *COLOR*
:   Defines the foreground color. The given color must be part of the following foreground colors: 
    red | green | yellow | blue | magenta | cyan | lightgray | default | darkgray | black | lightred | lightgreen | lightyellow | lightblue | lightmagenta | lightcyan | white.

-b *BACKGROUND*, \--background *BACKGROUND*
:   Defines the background color. The given background must be part of the following background colors: 
    red  |  green  |  black  |  yellow  |  blue  |  magenta  |  cyan  |  lightgray  |  default  |  darkgray  | lightred  |  lightgreen  |  lightyellow  |  lightblue  |  lightmagenta  |  lightcyan  |  white  |

-f *FORMAT*, \--format *FORMAT*
:   Defines the format. The given format must be part of the following formats: bold bright dim underlined reverse

-n
:   Do not output the trailing newline.

-h, \--help
:   Displays a short-help text and exits.


# BUGS

Submit bug reports online at: <https://github.com/kristuff/echolor/issues>

# SEE ALSO

Source code at: <https://github.com/kristuff/echolor>


