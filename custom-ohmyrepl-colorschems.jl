#==============================================================================
    custom color schemes - trial run
        OHMyREPL documentation
        github OhMyREPL.jl syntax_highlighting.md

    author:     merlinr@
 =============================================================================#

using DesertIslandDisk

using OhMyREPL, Crayons

import OhMyREPL: Passes.SyntaxHighlighter


# look at system colors
Crayons.test_system_colors()
Crayons.test_24bit_colors()

# list them all
colorschemes


test_colorscheme("Tomorrow24bit")



# try to make one #
# =============== #

cathode_basic = SyntaxHighlighter.ColorScheme()

test_colorscheme(cathode_basic)


#=  setters available
symbol!               symbol, ex :symbol
comment!              comment, ex # comment, #= block comment =#
string!               string or char, ex """string""", 'a'
call!                 functionc all, ex foo()
op!                   operator, ex *, √
keyword!              keyword, ex function, begin, try
function_def!         function definition, ex function foo(x) x end
error!                error in the Tokenizer, ex #= unending multi comment =#
argdef!               Definition of a type, ex ::Float64
macro!                macro, ex @time
number!               number, ex 100, 100_00.0, 0xf00
text!                 Nothing of the above

# colors defaults
black  blink  blue  bold  cyan  default  green  hidden  light_black  light_blue  
light_cyan  light_green  light_magenta  light_red  light_yellow  magenta  normal  
nothing  red  reverse  underline  white  yellow

-> iterm ANSI color names?
black
dark_gray   "bright black"
light_gray  "white normal"
white       "bright white"
light_      "bright _" usually
bold        "bold" ?
=#

# work from the iterm profile colors
# iterm color preset: cathode
Crayons.test_24bit_colors()

# can remove the SyntaxHighlighter prefix if you fork and modify the package
function create_cathode_basic()
    cs = SyntaxHighlighter.ColorScheme()
    SyntaxHighlighter.symbol!(cs, Crayon(foreground = :light_red, bold = true))
    SyntaxHighlighter.macro!(cs, Crayon(foreground = :light_cyan))
    SyntaxHighlighter.keyword!(cs, Crayon(foreground = :cyan, bold = true))
    SyntaxHighlighter.function_def!(cs, Crayon(foreground = :magenta, bold = true))
    SyntaxHighlighter.call!(cs, Crayon(foreground = :light_magenta))
    SyntaxHighlighter.op!(cs, Crayon(foreground = :light_blue))
    SyntaxHighlighter.number!(cs, Crayon(foreground = :light_yellow))
    SyntaxHighlighter.text!(cs, Crayon(foreground = :green))
    SyntaxHighlighter.comment!(cs, Crayon(foreground = :black))
    SyntaxHighlighter.string!(cs, Crayon(foreground = :red))
    SyntaxHighlighter.argdef!(cs, Crayon(foreground = :blue))
    SyntaxHighlighter.error!(cs, Crayon(foreground = :light_gray))
    return cs
end

test_colorscheme(create_cathode_basic())

SyntaxHighlighter.add!("CathodeBasic", create_cathode_basic())

colorscheme!("CathodeBasic")

# OKAY thats pretty good.
