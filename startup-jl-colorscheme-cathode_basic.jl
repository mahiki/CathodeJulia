#==============================================================================
    colorscheme: cathode_basic
        REPL colorschme definition
        load this during julia startup (not extending OhMyREPL)
        iterm color: Cathode*

    tested:     NO
    author:     merlinr@
 =============================================================================#

using Crayons

using OhMyREPL: Passes.SyntaxHighlighter


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

SyntaxHighlighter.add!("CathodeBasic", create_cathode_basic())

colorscheme!("CathodeBasic")
