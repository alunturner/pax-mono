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

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	-- base colours and variant
	local dark = hsl(0, 0, 10)
	local bright = hsl(0, 0, 90)

	-- ramps from bg to fg
	local dark_plus = dark.mix(bright, 10)
	local dark_plus_plus = dark.mix(bright, 20)
	local mid = dark.mix(bright, 60)
	local mid_plus = dark.mix(bright, 70)
	local bright_minus_minus = dark.mix(bright, 80)
	local bright_minus = dark.mix(bright, 90)

	-- errors and warnings
	local red = hsl(0, 70, 60)
	local orange = hsl(34, 70, 60)
	local green = hsl(120, 70, 60)
	local tmux = hsl(300, 60, 20)

	-- utils
	local hidden = { fg = dark, bg = dark }

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
		Normal({ fg = bright, bg = dark }), -- Normal text
		ColorColumn({ bg = dark_plus }), -- Columns set with 'colorcolumn'
		Conceal(hidden), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ Normal }), -- Character under the cursor
		CurSearch({ Normal, gui = "reverse" }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ Cursor }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ Cursor }), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorLine({ bg = dark_plus_plus }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn({ CursorLine }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Directory({ fg = bright }), -- Directory names (and other special names in listings)
		DiffAdd({}), -- Diff mode: Added line |diff.txt|
		DiffChange({}), -- Diff mode: Changed line |diff.txt|
		DiffDelete({}), -- Diff mode: Deleted line |diff.txt|
		DiffText({}), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer(hidden), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({}), -- Cursor in a focused terminal
		TermCursorNC({}), -- Cursor in an unfocused terminal
		ErrorMsg({ fg = red }), -- Error messages on the command line
		VertSplit({ Normal }), -- Column separating vertically split windows
		Folded({}), -- Line used for closed folds
		FoldColumn({}), -- 'foldcolumn'
		SignColumn({}), -- Column where |signs| are displayed
		IncSearch({ Normal, gui = "reverse" }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ CurSearch }), -- |:substitute| replacement text highlighting
		LineNr({ fg = mid }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({}), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({}), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ CursorLine, fg = bright }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ CursorLine }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ CursorLine }), -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ Normal, gui = "reverse" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ Normal }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ ModeMsg }), -- Area for messages and cmdline
		MsgSeparator({ ModeMsg }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ ModeMsg }), -- |more-prompt|
		NonText({}), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalFloat({ Normal }), -- Normal text in floating windows.
		FloatBorder({ fg = bright }), -- Border of floating windows.
		FloatTitle({ Normal }), -- Title of floating windows.
		NormalNC({ Normal }), -- normal text in non-current windows
		Pmenu({ fg = bright_minus, bg = dark_plus }), -- Popup menu: Normal item.
		PmenuSel({ Pmenu, gui = "reverse" }), -- Popup menu: Selected item.
		PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
		PmenuExtra({ Pmenu }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ PmenuSel }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = dark_plus }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = bright_minus }), -- Popup menu: Thumb of the scrollbar.
		Question({ ModeMsg }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ PmenuSel }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ IncSearch }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ Normal }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad({ Normal }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ Normal })(), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ Normal }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ Normal }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ Normal }), -- Status line of current window
		StatusLineNC(hidden), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({}), -- Tab pages line, not active tab page label
		TabLineFill({}), -- Tab pages line, where there are no labels
		TabLineSel({}), -- Tab pages line, active tab page label
		Title({ Normal }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ fg = dark_plus_plus, bg = bright_minus_minus }), -- Visual mode selection
		VisualNOS({ Visual }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = orange }), -- Warning messages
		Whitespace({ Normal }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({}), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ PmenuSel }), -- Current match in 'wildmenu' completion
		WinBar({}), -- Window bar of current window
		WinBarNC({}), -- Window bar of not-current windows
		-- CUSTOM RULER
		CustomRulerSeparator({ ModeMsg }),
		CustomRulerIcon({ ModeMsg, gui = "reverse" }),
		CustomRulerFile({ ModeMsg }),
		CustomRulerError({ ModeMsg, fg = red }),

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = mid, gui = "italic" }), -- Any comment

		Constant({ fg = bright }), -- (*) Any constant
		-- String { }, --   A string constant: "this is a string"
		-- Character { }, --   A character constant: 'c', '\n'
		-- Number { }, --   A number constant: 234, 0xff
		-- Boolean        { }, --   A boolean constant: TRUE, false
		-- Float { }, --   A floating point constant: 2.3e10

		Identifier({ fg = bright }), -- (*) Any variable name
		Function({ Identifier }), --   Function name (also: methods for classes)

		Statement({ fg = mid_plus, gui = "bold" }), -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		-- Operator       { }, --   "sizeof", "+", "*", etc.
		-- Keyword        { }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc({ Statement }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = bright_minus_minus }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ Normal }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		Delimiter({ fg = bright_minus_minus, gui = "bold" }), --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		Ignore({ Normal }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ Normal }), -- Any erroneous construct
		Todo({ Normal }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ Normal }), -- Used for highlighting "text" references
		LspReferenceRead({ Normal }), -- Used for highlighting "read" references
		LspReferenceWrite({ Normal }), -- Used for highlighting "write" references
		LspCodeLens({ Normal }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator({ Normal }), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ PmenuSel }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = orange }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = mid }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = mid }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = mid }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({ DiagnosticError, gui = "underline" }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ DiagnosticWarn, gui = "underline" }), -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo(), -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint(), -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk(), -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = green, bg = "unset" }), -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn(), -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo(), -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint(), -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk(), -- Used for "Ok" signs in sign column.

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

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag

		-- Treesitter Language specific - nb although these look the same,
		-- combining them causes funny highlighting in TSX delimiters.
		-- JSX
		sym("@boolean.javascript")({ Type }), -- true/false
		sym("@constant.builtin.javascript")({ Type }), -- null/undefined
		sym("@constructor.javascript")({ Function }), -- treat constructor as a method
		sym("@function.builtin.javascript")({ Statement }), -- hit require
		sym("@tag.builtin.javascript")({ Type }), -- div/a/span etc.
		sym("@tag.javascript")({ Type }), -- custom components
		sym("@none.javascript")({ Constant }), -- text inside tags

		-- TS
		sym("@boolean.typescript")({ Type }), -- true/false
		sym("@constant.builtin.typescript")({ Type }), -- null/undefined

		-- TSX
		sym("@boolean.tsx")({ Type }), -- true/false
		sym("@constant.builtin.tsx")({ Type }), -- null/undefined
		sym("@constant.builtin.tsx")({ Constant }), -- null/undefined
		sym("@constructor.tsx")({ Function }), -- treat constructor as a method
		sym("@tag.attribute.tsx")({ Delimiter }),
		sym("@tag.delimiter.tsx")({ Delimiter }),
		sym("@tag.builtin.tsx")({ Type }), -- div/a/span etc.
		sym("@tag.tsx")({ Type }), -- custom components
		sym("@none.tsx")({ Constant }), -- text inside tags

		-- Lua
		sym("@boolean.lua")({ Type }), -- true/false
		sym("@constructor.lua")({ Delimiter }), -- the export from a module
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
