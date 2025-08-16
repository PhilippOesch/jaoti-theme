--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local colors = {
	bg_dark = hsl("#252326"),
	bg = hsl("#2a272b"),
	bg2 = hsl("#363636"),
	fg = hsl("#afa2bf"),
	gray = hsl("#55505e"),
	purple = hsl("#A58AF9"),
	red = hsl("#f2658d"),
	green = hsl("#82d66b"),
	blue = hsl("#8e9adb"),
	orange = hsl("#e09e64"),
	yellow = hsl("#d8d85b"),
	turquoise = hsl("#7cbfb7"),
	cyan = hsl("#68b5d1"),
	none = "NONE",
    pink = hsl('#d891d8')
}

-- colors.light_blue = colors.cyan.darken(20).desaturate(40).lighten(30)
colors.purple_dark = colors.purple.mix(colors.bg_dark, 50)
colors.blue_dark = colors.blue.mix(colors.bg_dark, 30)
colors.gray_light = colors.gray.mix(colors.fg, 50)
colors.gray_dark = colors.gray.mix(colors.bg_dark, 30)
-- colors.green_light = colors.green.mix(colors.fg, 30)
colors.green_dark = colors.green.mix(colors.bg_dark, 80)
colors.yellow_dark = colors.yellow.mix(colors.bg_dark, 50)
colors.green2 = colors.green.mix(colors.cyan, 30).desaturate(20)
colors.red_dark = colors.red.mix(colors.bg_dark, 70)
colors.red2 = colors.red.desaturate(40).lighten(20)
colors.turquoise_dark = colors.turquoise.mix(colors.bg_dark, 80)
colors.cyan_dark = colors.cyan.mix(colors.bg_dark, 70)
colors.orange_light = colors.orange.mix(colors.fg, 40)
colors.orange_dark = colors.orange.mix(colors.bg_dark, 70)

-- group1: keywords, tag
-- group2: functions
-- group3: variable
-- group4: variable.member, @properties
-- group5: variable.parameter, tag.builtin
-- group6: contants
-- group7: strings
-- group8: tag attribute, type
-- group8: brackest

local colorGroups = {
--- group1: keywords, tag
  group1 = colors.pink,
  group2 = colors.cyan,
  group3 = colors.fg,
  group4 = colors.blue,
  group5 = colors.orange,
  group6 = colors.purple,
  group7 = colors.green2,
  group8 = colors.turquoise,
  group9 = colors.gray_light
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn{ bg = colors.bg }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor{ bg = colors.fg, fg = colors.bg_dark }, -- Character under the cursor
		CurSearch{ bg = colors.yellow_dark  }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor{ bg = colors.fg, fg = colors.bg_dark }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM{ bg = colors.fg, fg = colors.bg_dark }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory{ fg = colors.turquoise }, -- Directory names (and other special names in listings)
		DiffAdd{ fg = colors.fg, bg = colors.green_dark }, -- Diff mode: Added line |diff.txt|
		DiffChange{ bg = colors.cyan_dark, fg = colors.fg }, -- Diff mode: Changed line |diff.txt|
		DiffDelete{ bg = colors.red_dark, fg = colors.fg }, -- Diff mode: Deleted line |diff.txt|
		DiffText{ bg = colors.cyan_dark, fg= colors.fg }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    {  }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg       { fg = colors.red, bg = colors.red_dark }, -- Error messages on the command line
		VertSplit       { bg = colors.bg,  fg = colors.bg2}, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { bg = colors.purple_dark }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute     { bg = colors.orange_dark }, -- |:substitute| replacement text highlighting
		LineNr         { fg = colors.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr   { fg = colors.turquoise }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg        { fg = colors.green }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg        { fg = colors.turquoise }, -- |more-prompt|
		NonText{ fg = colors.bg2 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal{ bg = colors.bg_dark, fg = colors.fg }, -- Normal text
		NormalFloat{ bg = colors.bg, fg = colors.fg }, -- Normal text in floating windows.
		FloatBorder    { fg = colors.bg2 }, -- Border of floating windows.
		FloatTitle     { bold = true }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		PmenuSel       { bg = colors.gray_light, fg = colors.bg_dark }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		PmenuThumb     { bg = colors.gray }, -- Popup menu: Thumb of the scrollbar.
		Question       { fg = colors.turquoise }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine   {  fg = colors.turquoise }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search         {  bg = colors.yellow_dark }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine{ fg = colors.fg, bg = colors.bg }, -- Status line of current window
		StatusLineNC   { bg = colors.gray_dark, fg = colors.fg}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		Visual         { bg = colors.bg2}, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg     { fg = colors.orange, bg = colors.orange_dark }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator{ fg = colors.bg2 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		WinBar{ bg = colors.bg }, -- Window bar of current window
		WinBarNC{ bg = colors.bg }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment        { fg = colors.gray, italic = true}, -- Any comment
		--
		Constant       { fg = colorGroups.group6 }, -- (*) Any constant
		String         { fg = colorGroups.group7 }, --   A string constant: "this is a string"
		-- Character      {  fg = colors.green2 }, --   A character constant: 'c', '\n'
		-- -- Number         { }, --   A number constant: 234, 0xff
		-- -- Boolean        { }, --   A boolean constant: TRUE, false
		-- -- Float          { }, --   A floating point constant: 2.3e10
		--
		Identifier     { fg = colorGroups.cyan }, -- (*) Any variable name
		Function       { fg = colorGroups.group2 }, --   Function name (also: methods for classes)
		--
		-- Statement      { fg = colors.pink  }, -- (*) Any statement
		-- -- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- -- Repeat         { }, --   for, do, while, etc.
		-- -- Label          { }, --   case, default, etc.
		-- Operator       { fg = colors.turquoise }, --   "sizeof", "+", "*", etc.
		Keyword        { fg = colorGroups.group1 }, --   any other keyword
		-- -- Exception      {  fg = colors.purple }, --   try, catch, throw
		--
		-- -- PreProc        { }, -- (*) Generic Preprocessor
		-- -- Include        { }, --   Preprocessor #include
		-- -- Define         { }, --   Preprocessor #define
		-- -- Macro          { }, --   Same as Define
		-- -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.
		--
		Type           { fg = colorGroups.group8 }, -- (*) int, long, char, etc.
		-- -- StorageClass   { }, --   static, register, volatile, etc.
		-- -- Structure      { }, --   struct, union, enum, etc.
		-- -- Typedef        { }, --   A typedef
		--
		Special        { fg = colorGroups.group2 }, -- (*) Any special symbol
		-- -- SpecialChar    { }, --   Special character in a constant
		Tag            { fg = colorGroups.group1 }, --   You can use CTRL-] on this
		-- -- Delimiter      { }, --   Character that needs attention
		-- -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- -- Debug          { }, --   Debugging statements
		--
		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error          { fg = colors.red, bg = colors.red_dark}, -- Any erroneous construct
		Todo           { bg = colors.yellow, fg = colors.bg_dark }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError            { fg = colors.red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn             { fg= colors.orange } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo             { fg = colors.turquoise } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint             { fg = colors.cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk               { fg = colors.green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- -- sym"@text.literal"      { }, -- Comment
		-- -- sym"@text.reference"    { }, -- Identifier
		-- -- sym"@text.title"        { }, -- Title
		-- -- sym"@text.uri"          { }, -- Underlined
		-- -- sym"@text.underline"    { }, -- Underlined
		-- -- sym"@text.todo"         { }, -- Todo
		-- -- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		sym"@constant"          { fg = colorGroups.group6 }, -- Constant
		-- -- sym"@constant.builtin"  { }, -- Special
		-- -- sym"@constant.macro"    { }, -- Define
		-- -- sym"@define"            { }, -- Define
		-- -- sym"@macro"             { }, -- Macro
		-- -- sym"@string"            { }, -- String
		-- -- sym"@string.escape"     { }, -- SpecialChar
		-- -- sym"@string.special"    { }, -- SpecialChar
		-- -- sym"@character"         { }, -- Character
		-- -- sym"@character.special" { }, -- SpecialChar
		-- -- sym"@number"            { }, -- Number
		-- -- sym"@boolean"           { }, -- Boolean
		-- -- sym"@float"             { }, -- Float
		-- -- sym"@function"          { }, -- Function
		-- -- sym"@function.builtin"  { }, -- Special
		-- -- sym"@function.macro"    { }, -- Macro
		-- -- sym"@parameter"         { }, -- Identifier
		-- -- sym"@method"            { }, -- Function
		-- -- sym"@field"             { }, -- Identifier
		sym"@property"          { fg = colorGroups.group4 }, -- Identifier
		-- -- sym"@constructor"       { }, -- Special
		-- -- sym"@conditional"       { }, -- Conditional
		-- -- sym"@repeat"            { }, -- Repeat
		-- -- sym"@label"             { }, -- Label
		-- -- sym"@operator"          { }, -- Operator
		-- -- sym"@keyword"           { }, -- Keyword
		-- -- sym"@exception"         { }, -- Exception
		sym"@variable"          {  fg = colorGroups.group3 }, -- Identifier
		-- -- sym"@type"              { }, -- Type
		-- -- sym"@type.definition"   { }, -- Typedef
		-- -- sym"@storageclass"      { }, -- StorageClass
		-- -- sym"@structure"         { }, -- Structure
		-- -- sym"@namespace"         { }, -- Identifier
		-- -- sym"@include"           { }, -- Include
		-- -- sym"@preproc"           { }, -- PreProc
		-- -- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { fg = colors.purple }, -- Tag

        -- Additional Diff
		Removed               { fg = colors.red2, ctermfg = 9 } ,
		Added               { fg = colors.green, ctermfg = 10 } ,
		Changed               { fg = colors.cyan, ctermfg = 14 } ,


		sym"@variable.member"          {  fg = colorGroups.group4 }, -- Identifier
		sym"@variable.parameter"          {  fg = colorGroups.group5 }, -- Identifier
		sym"@tag.builtin"          {  fg = colorGroups.group5 }, -- Identifier
		-- sym"@tag.javascript"               { fg = colors.blue }, -- Tag
		sym"@tag.attribute"               { fg = colorGroups.group8 }, -- Tag
		-- sym"@keyword.import"               { fg = colors.turquoise }, -- Tag

		sym"@punctuation.bracket"       { fg = colorGroups.group9 }, -- Delimiter
		sym"@punctuation.delimiter"       { fg = colorGroups.group9 }, -- Delimiter
		sym"@constant.javascript"          { fg = colorGroups.group6 }, -- Constant

		sym"@lsp"          { fg = nil }, -- Constant
		sym"@lsp.type.variable"          { fg = nil }, -- Constant

	}
end)



-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
