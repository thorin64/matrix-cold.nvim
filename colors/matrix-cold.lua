-- matrix_cold.lua
-- A full Neovim IDE colorscheme based on the global system theme.
-- Clears all existing highlights and resets syntax.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

-- Set the theme name
vim.g.colors_name       = "matrix_cold"

-- Terminal color palette (for :terminal), matching the global theme
vim.g.terminal_color_0  = "#00330d"
vim.g.terminal_color_1  = "#00661a"
vim.g.terminal_color_2  = "#009927"
vim.g.terminal_color_3  = "#00cc34"
vim.g.terminal_color_4  = "#00ff41"
vim.g.terminal_color_5  = "#33ff67"
vim.g.terminal_color_6  = "#66ff8d"
vim.g.terminal_color_7  = "#959595"
vim.g.terminal_color_8  = "#009927"
vim.g.terminal_color_9  = "#00cc34"
vim.g.terminal_color_10 = "#00ff41"
vim.g.terminal_color_11 = "#1aff54"
vim.g.terminal_color_12 = "#4dff7a"
vim.g.terminal_color_13 = "#80ffa0"
vim.g.terminal_color_14 = "#b3ffc6"
vim.g.terminal_color_15 = "#ffffff"

-- Italic toggle (set `vim.g.matrix_italic = false` to disable italics)
local use_italic        = vim.g.matrix_italic ~= false

-- Core palette derived from the global theme
local colors            = {
	black        = "#000000", -- main background
	white        = "#ffffff", -- pure white for titles, errors, etc.
	cursor       = "#009927", -- cursor color
	cursor_fg    = "#ffffff", -- text color under cursor
	selection_bg = "#00661a", -- visual selection background
	selection_fg = "#00ff41", -- visual selection text

	gray         = "#959595", -- comments, dim text
	dark0        = "#00330d", -- very dark green (NonText, fold, etc.)
	dark1        = "#00661a", -- dark green (numbers, floats)
	dark2        = "#009927", -- medium-dark green (strings, line numbers)
	mid          = "#00cc34", -- medium green (constants, booleans)
	neon         = "#00ff41", -- main foreground (identifiers, functions)
	light1       = "#1aff54", -- light green (types, statements)
	light2       = "#33ff67", -- lighter green (operators, builtins)
	light3       = "#4dff7a", -- even lighter (parameters, preprocessor)
	light4       = "#66ff8d", -- pale green (properties, fields)
	light5       = "#80ffa0", -- very pale green (unused but available)
	light6       = "#b3ffc6", -- almost white green (unused but available)
}

-- =============================================================================
--  HIGHLIGHT GROUPS
-- =============================================================================
local highlights        = {

	------------------------- BASE UI -------------------------
	Normal                            = { bg = colors.black, fg = colors.neon },
	NonText                           = { fg = colors.dark0 },
	EndOfBuffer                       = { fg = colors.black }, -- hide ~ at buffer end
	LineNr                            = { fg = colors.dark2 },
	CursorLine                        = { bg = colors.dark0 }, -- current line highlight
	CursorLineNr                      = { fg = colors.white, bold = true },
	Cursor                            = { bg = colors.cursor, fg = colors.cursor_fg },
	CursorColumn                      = { bg = colors.dark0 }, -- cursor column highlight
	Visual                            = { bg = colors.selection_bg, fg = colors.selection_fg },
	VisualNOS                         = { bg = colors.selection_bg, fg = colors.selection_fg },
	Search                            = { bg = colors.neon, fg = colors.black },
	IncSearch                         = { bg = colors.white, fg = colors.black },
	CurSearch                         = { bg = colors.light1, fg = colors.black, bold = true },
	MatchParen                        = { bg = colors.dark0, fg = colors.white, bold = true },
	ColorColumn                       = { bg = colors.dark0 }, -- e.g., at 80 chars
	SignColumn                        = { bg = colors.black }, -- gutter background
	WinSeparator                      = { fg = colors.dark0 }, -- window borders
	FoldColumn                        = { bg = colors.black, fg = colors.gray },
	Folded                            = { bg = colors.dark0, fg = colors.mid },
	Conceal                           = { fg = colors.gray },
	SpecialKey                        = { fg = colors.dark1 }, -- tabs, trailing spaces, etc.
	Title                             = { fg = colors.white, bold = true },
	Directory                         = { fg = colors.neon, bold = true },

	------------------------- STATUS & TABLINES -------------------------
	StatusLine                        = { bg = colors.dark0, fg = colors.neon },
	StatusLineNC                      = { bg = colors.black, fg = colors.dark2 },
	StatusLineTerm                    = { bg = colors.dark0, fg = colors.neon },
	StatusLineTermNC                  = { bg = colors.black, fg = colors.dark2 },
	TabLine                           = { bg = colors.black, fg = colors.dark2 },
	TabLineFill                       = { bg = colors.black },
	TabLineSel                        = { bg = colors.dark0, fg = colors.white, bold = true },
	VertSplit                         = { fg = colors.dark0 },

	------------------------- FLOATING WINDOWS -------------------------
	NormalFloat                       = { bg = colors.black, fg = colors.neon },
	FloatBorder                       = { fg = colors.dark0, bg = colors.black },
	FloatTitle                        = { fg = colors.white, bg = colors.black, bold = true },

	------------------------- MESSAGES / COMMAND LINE -------------------------
	ErrorMsg                          = { bg = colors.white, fg = colors.black },
	WarningMsg                        = { fg = colors.white, bold = true },
	MoreMsg                           = { fg = colors.neon, bold = true },
	Question                          = { fg = colors.neon, bold = true },
	ModeMsg                           = { fg = colors.neon, bold = true },
	MsgArea                           = { bg = colors.black, fg = colors.neon },
	MsgSeparator                      = { fg = colors.dark0 },

	------------------------- COMPLETION MENU -------------------------
	Pmenu                             = { bg = colors.dark0, fg = colors.mid },
	PmenuSel                          = { bg = colors.neon, fg = colors.black, bold = true },
	PmenuSbar                         = { bg = colors.black }, -- menu scrollbar
	PmenuThumb                        = { bg = colors.dark0 },
	WildMenu                          = { bg = colors.neon, fg = colors.black, bold = true },

	------------------------- QUICKFIX -------------------------
	QuickFixLine                      = { bg = colors.dark0, fg = colors.white, bold = true },
	QuickFixList                      = { bg = colors.black, fg = colors.neon },

	------------------------- DIFF -------------------------
	DiffAdd                           = { bg = "#0a2e0a" },
	DiffChange                        = { bg = "#1a2e0a" },
	DiffDelete                        = { bg = "#2e0a0a" },
	DiffText                          = { bg = "#0a3e0a" },
	diffAdded                         = { fg = colors.light2 },
	diffRemoved                       = { fg = colors.white },
	diffChanged                       = { fg = colors.mid },
	diffFile                          = { fg = colors.neon, bold = true },

	------------------------- SPELL -------------------------
	SpellBad                          = { sp = colors.white, undercurl = true },
	SpellCap                          = { sp = colors.neon, undercurl = true },
	SpellRare                         = { sp = colors.mid, undercurl = true },
	SpellLocal                        = { sp = colors.light2, undercurl = true },

	------------------------- SYNTAX -------------------------
	-- Carefully differentiated shades of green for each semantic category
	Comment                           = { fg = colors.gray, italic = use_italic },
	Constant                          = { fg = colors.mid }, -- literal constants
	String                            = { fg = colors.dark2 }, -- strings
	Character                         = { fg = colors.dark2 },
	Number                            = { fg = colors.dark1 }, -- numbers
	Boolean                           = { fg = colors.mid },
	Float                             = { fg = colors.dark1 },

	Identifier                        = { fg = colors.neon },         -- variables, identifiers
	Function                          = { fg = colors.neon, bold = true }, -- function names
	Statement                         = { fg = colors.light1, bold = true }, -- if, for, return
	Conditional                       = { fg = colors.light1, bold = true },
	Repeat                            = { fg = colors.light1, bold = true },
	Label                             = { fg = colors.light1 },
	Operator                          = { fg = colors.light2 },    -- +, -, etc.
	Keyword                           = { fg = colors.mid, bold = true }, -- import, include
	Exception                         = { fg = colors.light1, bold = true },

	PreProc                           = { fg = colors.light3 }, -- preprocessor
	Include                           = { fg = colors.light3 },
	Define                            = { fg = colors.light3 },
	Macro                             = { fg = colors.light3 },
	PreCondit                         = { fg = colors.light3 },

	Type                              = { fg = colors.light1 }, -- int, String, class names
	StorageClass                      = { fg = colors.light1 },
	Structure                         = { fg = colors.light1 },
	Typedef                           = { fg = colors.light1 },

	Special                           = { fg = colors.white }, -- special symbols
	SpecialChar                       = { fg = colors.white },
	Tag                               = { fg = colors.light4 }, -- HTML tags
	Delimiter                         = { fg = colors.neon }, -- parentheses, brackets
	SpecialComment                    = { fg = colors.gray },
	Debug                             = { fg = colors.white },
	Error                             = { bg = colors.white, fg = colors.black },
	Todo                              = { bg = colors.dark0, fg = colors.white, bold = true },
	Underlined                        = { underline = true },

	------------------------- LSP DIAGNOSTICS -------------------------
	DiagnosticError                   = { fg = colors.white },
	DiagnosticWarn                    = { fg = colors.dark1 }, -- dark green for warnings
	DiagnosticInfo                    = { fg = colors.mid },
	DiagnosticHint                    = { fg = colors.light2 },
	DiagnosticUnderlineError          = { sp = colors.white, undercurl = true }, -- white wavy underline
	DiagnosticUnderlineWarn           = { sp = colors.dark1, undercurl = true },
	DiagnosticUnderlineInfo           = { sp = colors.mid, undercurl = true },
	DiagnosticUnderlineHint           = { sp = colors.light2, undercurl = true },
	DiagnosticSignError               = { fg = colors.white },
	DiagnosticSignWarn                = { fg = colors.dark1 },
	DiagnosticSignInfo                = { fg = colors.mid },
	DiagnosticSignHint                = { fg = colors.light2 },
	DiagnosticVirtualTextError        = { fg = colors.white, bg = colors.dark0 },
	DiagnosticVirtualTextWarn         = { fg = colors.dark1, bg = colors.dark0 },
	DiagnosticVirtualTextInfo         = { fg = colors.mid, bg = colors.dark0 },
	DiagnosticVirtualTextHint         = { fg = colors.light2, bg = colors.dark0 },

	------------------------- LSP OTHER -------------------------
	LspReferenceText                  = { bg = colors.dark0 },
	LspReferenceRead                  = { bg = colors.dark0 },
	LspReferenceWrite                 = { bg = colors.dark0 },
	LspCodeLens                       = { fg = colors.gray },
	LspCodeLensSeparator              = { fg = colors.dark0 },
	LspSignatureActiveParameter       = { bg = colors.dark0, bold = true },

	------------------------- TREESITTER -------------------------
	-- Fine-grained semantic tokens with distinct greens
	["@comment"]                      = { link = "Comment" },
	["@error"]                        = { link = "Error" },

	["@string"]                       = { link = "String" },
	["@string.escape"]                = { fg = colors.white },
	["@string.regex"]                 = { fg = colors.mid },
	["@character"]                    = { link = "Character" },
	["@number"]                       = { link = "Number" },
	["@float"]                        = { link = "Float" },
	["@boolean"]                      = { link = "Boolean" },

	["@constant"]                     = { link = "Constant" },
	["@constant.builtin"]             = { fg = colors.mid },
	["@constant.macro"]               = { fg = colors.light3 },

	["@type"]                         = { fg = colors.light1 },
	["@type.builtin"]                 = { fg = colors.light2 },
	["@type.definition"]              = { fg = colors.light1 },

	["@keyword"]                      = { fg = colors.mid, bold = true },
	["@keyword.function"]             = { fg = colors.light1, bold = true },
	["@keyword.return"]               = { fg = colors.light1, bold = true },
	["@keyword.conditional"]          = { fg = colors.light1, bold = true },
	["@keyword.repeat"]               = { fg = colors.light1, bold = true },
	["@keyword.exception"]            = { fg = colors.light1, bold = true },

	["@function"]                     = { fg = colors.neon, bold = true },
	["@function.builtin"]             = { fg = colors.light1, bold = true },
	["@function.macro"]               = { fg = colors.light3 },
	["@method"]                       = { fg = colors.mid, bold = true }, -- distinct from functions
	["@constructor"]                  = { fg = colors.light2, bold = true },

	["@variable"]                     = { fg = colors.neon },
	["@variable.builtin"]             = { fg = colors.light2 },
	["@variable.parameter"]           = { fg = colors.light3 },

	["@property"]                     = { fg = colors.light4 },
	["@field"]                        = { fg = colors.light4 },

	["@operator"]                     = { fg = colors.light2 },
	["@punctuation"]                  = { fg = colors.neon },
	["@punctuation.delimiter"]        = { fg = colors.neon },
	["@punctuation.bracket"]          = { fg = colors.neon },
	["@punctuation.special"]          = { fg = colors.white },

	["@tag"]                          = { fg = colors.light4 },
	["@tag.delimiter"]                = { fg = colors.dark2 },
	["@tag.attribute"]                = { fg = colors.mid },

	["@namespace"]                    = { fg = colors.light1 },
	["@module"]                       = { fg = colors.light1 },

	["@text"]                         = { fg = colors.neon },
	["@text.strong"]                  = { fg = colors.white, bold = true },
	["@text.emphasis"]                = { fg = colors.light2, italic = use_italic },
	["@text.underline"]               = { underline = true },
	["@text.strike"]                  = { strikethrough = true },
	["@text.title"]                   = { fg = colors.white, bold = true },
	["@text.literal"]                 = { fg = colors.dark2 },
	["@text.uri"]                     = { fg = colors.mid, underline = true },
	["@text.math"]                    = { fg = colors.light3 },
	["@text.reference"]               = { fg = colors.mid },
	["@text.environment"]             = { fg = colors.mid },
	["@text.environment.name"]        = { fg = colors.mid },
	["@text.todo"]                    = { link = "Todo" },
	["@text.note"]                    = { fg = colors.light2, bold = true },
	["@text.warning"]                 = { fg = colors.white, bold = true },
	["@text.danger"]                  = { fg = colors.white, bold = true },

	["@diff.plus"]                    = { fg = colors.light2 },
	["@diff.minus"]                   = { fg = colors.white },
	["@diff.delta"]                   = { fg = colors.mid },

	------------------------- PLUGIN: Telescope -------------------------
	TelescopeBorder                   = { fg = colors.dark0, bg = colors.black },
	TelescopePromptBorder             = { fg = colors.dark0, bg = colors.black },
	TelescopeTitle                    = { fg = colors.white, bg = colors.black, bold = true },
	TelescopePromptTitle              = { fg = colors.white, bg = colors.black, bold = true },
	TelescopeNormal                   = { fg = colors.neon, bg = colors.black },
	TelescopeSelection                = { bg = colors.dark0, fg = colors.white },
	TelescopeMatching                 = { fg = colors.white, bold = true },
	TelescopePreviewNormal            = { bg = colors.black },
	TelescopePreviewBorder            = { fg = colors.dark0, bg = colors.black },
	TelescopeResultsNormal            = { bg = colors.black },
	TelescopeResultsBorder            = { fg = colors.dark0, bg = colors.black },
	TelescopePromptNormal             = { bg = colors.black },
	TelescopeMultiSelection           = { fg = colors.neon, bg = colors.dark0 },
	TelescopePreviewLine              = { bg = colors.dark0 },
	TelescopePromptCounter            = { fg = colors.gray },
	TelescopeSelectionCaret           = { fg = colors.neon },

	------------------------- PLUGIN: nvim-cmp -------------------------
	-- Differentiate completion item kinds with distinct greens
	CmpItemAbbr                       = { fg = colors.neon },
	CmpItemAbbrMatch                  = { fg = colors.white, bold = true },
	CmpItemAbbrMatchFuzzy             = { fg = colors.light2 },
	CmpItemKind                       = { fg = colors.mid },
	CmpItemMenu                       = { fg = colors.gray },
	CmpItemKindDefault                = { fg = colors.neon },
	CmpItemKindKeyword                = { fg = colors.mid, bold = true },
	CmpItemKindVariable               = { fg = colors.neon },
	CmpItemKindField                  = { fg = colors.light4 },
	CmpItemKindProperty               = { fg = colors.light4 },
	CmpItemKindFunction               = { fg = colors.neon, bold = true },
	CmpItemKindMethod                 = { fg = colors.mid, bold = true },
	CmpItemKindConstructor            = { fg = colors.light2, bold = true },
	CmpItemKindClass                  = { fg = colors.light1 },
	CmpItemKindInterface              = { fg = colors.light2 },
	CmpItemKindStruct                 = { fg = colors.light1 },
	CmpItemKindEnum                   = { fg = colors.light1 },
	CmpItemKindEnumMember             = { fg = colors.light2 },
	CmpItemKindConstant               = { fg = colors.mid },
	CmpItemKindTypeParameter          = { fg = colors.light3 },
	CmpItemKindSnippet                = { fg = colors.dark2 },
	CmpItemKindText                   = { fg = colors.light2 },
	CmpItemKindUnit                   = { fg = colors.light1 },
	CmpItemKindFolder                 = { fg = colors.mid },
	CmpItemKindFile                   = { fg = colors.neon },
	CmpItemKindReference              = { fg = colors.light1 },
	CmpItemKindColor                  = { fg = colors.light2 },
	CmpItemKindValue                  = { fg = colors.mid },
	CmpItemKindOperator               = { fg = colors.light2 },

	------------------------- PLUGIN: nvim-tree -------------------------
	NvimTreeNormal                    = { bg = colors.black, fg = colors.neon },
	NvimTreeEndOfBuffer               = { fg = colors.black },
	NvimTreeRootFolder                = { fg = colors.white, bold = true },
	NvimTreeFolderName                = { fg = colors.neon },
	NvimTreeFolderIcon                = { fg = colors.mid },
	NvimTreeOpenedFolderName          = { fg = colors.white, bold = true },
	NvimTreeEmptyFolderName           = { fg = colors.gray },
	NvimTreeIndentMarker              = { fg = colors.dark0 },
	NvimTreeVertSplit                 = { fg = colors.dark0 },
	NvimTreeSymlink                   = { fg = colors.light2 },
	NvimTreeExecFile                  = { fg = colors.light1, bold = true },
	NvimTreeSpecialFile               = { fg = colors.mid, bold = true },
	NvimTreeImageFile                 = { fg = colors.light2 },
	NvimTreeGitDirty                  = { fg = colors.mid },
	NvimTreeGitStaged                 = { fg = colors.light2 },
	NvimTreeGitNew                    = { fg = colors.neon },
	NvimTreeGitRenamed                = { fg = colors.light1 },
	NvimTreeGitDeleted                = { fg = colors.white },

	------------------------- PLUGIN: lualine -------------------------
	lualine_a_normal                  = { bg = colors.dark0, fg = colors.white, bold = true },
	lualine_b_normal                  = { bg = colors.black, fg = colors.neon },
	lualine_c_normal                  = { bg = colors.black, fg = colors.neon },
	lualine_a_insert                  = { bg = colors.neon, fg = colors.black, bold = true },
	lualine_b_insert                  = { bg = colors.black, fg = colors.neon },
	lualine_c_insert                  = { bg = colors.black, fg = colors.neon },
	lualine_a_visual                  = { bg = colors.selection_bg, fg = colors.white, bold = true },
	lualine_b_visual                  = { bg = colors.black, fg = colors.neon },
	lualine_c_visual                  = { bg = colors.black, fg = colors.neon },
	lualine_a_replace                 = { bg = colors.white, fg = colors.black, bold = true },
	lualine_b_replace                 = { bg = colors.black, fg = colors.neon },
	lualine_c_replace                 = { bg = colors.black, fg = colors.neon },
	lualine_a_command                 = { bg = colors.dark2, fg = colors.black, bold = true },
	lualine_b_command                 = { bg = colors.black, fg = colors.neon },
	lualine_c_command                 = { bg = colors.black, fg = colors.neon },
	lualine_a_inactive                = { bg = colors.black, fg = colors.gray },
	lualine_b_inactive                = { bg = colors.black, fg = colors.gray },
	lualine_c_inactive                = { bg = colors.black, fg = colors.gray },
	lualine_transitional_a            = { bg = colors.dark0, fg = colors.white },
	lualine_transitional_b            = { bg = colors.black, fg = colors.neon },
	lualine_transitional_c            = { bg = colors.black, fg = colors.neon },

	------------------------- PLUGIN: bufferline -------------------------
	BufferLineBackground              = { bg = colors.black, fg = colors.dark2 },
	BufferLineBufferSelected          = { bg = colors.dark0, fg = colors.white, bold = true },
	BufferLineBufferVisible           = { bg = colors.black, fg = colors.neon },
	BufferLineCloseButton             = { fg = colors.gray },
	BufferLineCloseButtonSelected     = { fg = colors.white },
	BufferLineTab                     = { bg = colors.black, fg = colors.dark2 },
	BufferLineTabSelected             = { bg = colors.dark0, fg = colors.white, bold = true },
	BufferLineIndicatorSelected       = { fg = colors.neon },
	BufferLineSeparator               = { fg = colors.dark0 },
	BufferLineModified                = { fg = colors.mid },
	BufferLineModifiedSelected        = { fg = colors.mid, bold = true },
	BufferLineDuplicate               = { fg = colors.gray },
	BufferLineDuplicateSelected       = { fg = colors.gray },
	BufferLinePick                    = { fg = colors.white },

	------------------------- PLUGIN: gitsigns -------------------------
	GitSignsAdd                       = { fg = colors.light2 },
	GitSignsChange                    = { fg = colors.mid },
	GitSignsDelete                    = { fg = colors.white },
	GitSignsAddNr                     = { fg = colors.light2 },
	GitSignsChangeNr                  = { fg = colors.mid },
	GitSignsDeleteNr                  = { fg = colors.white },
	GitSignsAddLn                     = { bg = "#0a2e0a" },
	GitSignsChangeLn                  = { bg = "#1a2e0a" },
	GitSignsDeleteLn                  = { bg = "#2e0a0a" },
	GitSignsCurrentLineBlame          = { fg = colors.gray },

	------------------------- PLUGIN: indent-blankline -------------------------
	IndentBlanklineChar               = { fg = colors.dark0 },
	IndentBlanklineContextChar        = { fg = colors.dark2 },
	IndentBlanklineSpaceChar          = { fg = colors.black },
	IndentBlanklineSpaceCharBlankline = { fg = colors.black },

	------------------------- PLUGIN: which-key -------------------------
	WhichKey                          = { fg = colors.neon },
	WhichKeyDesc                      = { fg = colors.gray },
	WhichKeySeparator                 = { fg = colors.dark0 },
	WhichKeyGroup                     = { fg = colors.mid, bold = true },
	WhichKeyFloat                     = { bg = colors.black, fg = colors.neon },
	WhichKeyBorder                    = { fg = colors.dark0 },

	------------------------- PLUGIN: noice -------------------------
	NoiceCmdlinePopupBorder           = { fg = colors.dark0, bg = colors.black },
	NoiceCmdlinePopupTitle            = { fg = colors.white, bold = true },
	NoiceCmdlineIcon                  = { fg = colors.neon },
	NoicePopupBorder                  = { fg = colors.dark0, bg = colors.black },
	NoiceMiniPopupBorder              = { fg = colors.dark0 },

	------------------------- PLUGIN: dashboard / alpha -------------------------
	AlphaHeader                       = { fg = colors.neon, bold = true },
	AlphaButtons                      = { fg = colors.mid },
	AlphaShortcut                     = { fg = colors.white, bold = true },
	AlphaFooter                       = { fg = colors.gray },
	DashboardHeader                   = { fg = colors.neon, bold = true },
	DashboardCenter                   = { fg = colors.neon },
	DashboardShortcut                 = { fg = colors.white, bold = true },
	DashboardFooter                   = { fg = colors.gray },

	------------------------- PLUGIN: nvim-notify -------------------------
	NotifyERRORBorder                 = { fg = colors.white },
	NotifyWARNBorder                  = { fg = colors.neon },
	NotifyINFOBorder                  = { fg = colors.mid },
	NotifyHINTBorder                  = { fg = colors.light2 },
	NotifyTRACEBorder                 = { fg = colors.gray },
	NotifyERRORTitle                  = { fg = colors.white, bold = true },
	NotifyWARNTitle                   = { fg = colors.neon, bold = true },
	NotifyINFOTitle                   = { fg = colors.mid, bold = true },
	NotifyHINTTitle                   = { fg = colors.light2, bold = true },
	NotifyTRACETitle                  = { fg = colors.gray, bold = true },
	NotifyERRORBody                   = { fg = colors.white },
	NotifyWARNBody                    = { fg = colors.neon },
	NotifyINFOBody                    = { fg = colors.mid },
	NotifyHINTBody                    = { fg = colors.light2 },
	NotifyTRACEBody                   = { fg = colors.gray },

	------------------------- PLUGIN: treesitter-context -------------------------
	TreesitterContext                 = { bg = colors.dark0 },
	TreesitterContextLineNumber       = { fg = colors.dark2, bg = colors.dark0 },
	TreesitterContextBottom           = { underline = true, sp = colors.neon },

	------------------------- PLUGIN: illuminate -------------------------
	IlluminatedWordText               = { bg = colors.dark0 },
	IlluminatedWordRead               = { bg = colors.dark0 },
	IlluminatedWordWrite              = { bg = colors.dark0 },

	------------------------- PLUGIN: hop / leap / lightspeed -------------------------
	HopNextKey                        = { fg = colors.white, bold = true },
	HopNextKey1                       = { fg = colors.neon, bold = true },
	HopNextKey2                       = { fg = colors.mid },
	LeapMatch                         = { fg = colors.white, bold = true, bg = colors.dark0 },
	LeapLabelPrimary                  = { fg = colors.black, bg = colors.neon, bold = true },
	LeapLabelSecondary                = { fg = colors.black, bg = colors.mid },
	LightspeedLabel                   = { fg = colors.black, bg = colors.neon, bold = true },
	LightspeedShortcut                = { fg = colors.white, bold = true },

	------------------------- PLUGIN: trouble -------------------------
	TroubleCount                      = { fg = colors.white, bold = true },
	TroubleNormal                     = { bg = colors.black },
	TroubleBorder                     = { fg = colors.dark0 },
	TroubleText                       = { fg = colors.neon },
	TroubleIndent                     = { fg = colors.dark0 },
	TroubleSource                     = { fg = colors.gray },
	TroubleCode                       = { fg = colors.mid },

	------------------------- PLUGIN: nvim-scrollbar -------------------------
	ScrollbarHandle                   = { bg = colors.dark0 },
	ScrollbarErrorHandle              = { bg = colors.white },
	ScrollbarWarnHandle               = { bg = colors.neon },
	ScrollbarInfoHandle               = { bg = colors.mid },
	ScrollbarHintHandle               = { bg = colors.light2 },
	ScrollbarSearchHandle             = { bg = colors.neon },
	ScrollbarCursorHandle             = { bg = colors.cursor },

	------------------------- PLUGIN: fidget -------------------------
	FidgetTitle                       = { fg = colors.white, bold = true },
	FidgetTask                        = { fg = colors.neon },
	FidgetWindow                      = { bg = colors.black },

	------------------------- PLUGIN: neo-tree -------------------------
	NeoTreeNormal                     = { bg = colors.black, fg = colors.neon },
	NeoTreeTitleBar                   = { fg = colors.white, bg = colors.dark0, bold = true },
	NeoTreeFileName                   = { fg = colors.neon },
	NeoTreeDirectoryName              = { fg = colors.neon, bold = true },
	NeoTreeFloatBorder                = { fg = colors.dark0, bg = colors.black },
}

-- Apply all highlight groups
for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
