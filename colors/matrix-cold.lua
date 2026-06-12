-- matrix_cold.lua
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name       = "matrix_cold"

-- Terminal colors - SUA PALETA EXATA
vim.g.terminal_color_0  = "#002a0a"
vim.g.terminal_color_1  = "#005515"
vim.g.terminal_color_2  = "#008020"
vim.g.terminal_color_3  = "#00aa2b"
vim.g.terminal_color_4  = "#00d436"
vim.g.terminal_color_5  = "#2be052"
vim.g.terminal_color_6  = "#55eb6e"
vim.g.terminal_color_7  = "#7a7a7a"
vim.g.terminal_color_8  = "#008020"
vim.g.terminal_color_9  = "#00aa2b"
vim.g.terminal_color_10 = "#00d436"
vim.g.terminal_color_11 = "#1add45"
vim.g.terminal_color_12 = "#40e65f"
vim.g.terminal_color_13 = "#6bf07f"
vim.g.terminal_color_14 = "#95f99f"
vim.g.terminal_color_15 = "#ffffff"

local use_italic        = vim.g.matrix_italic ~= false

-- Core palette - SUA PALETA
local colors            = {
	black        = "#000000",
	white        = "#ffffff",
	cursor       = "#008020",
	cursor_fg    = "#ffffff",
	selection_bg = "#005515",
	selection_fg = "#00d436",

	gray         = "#7a7a7a",
	dark0        = "#002a0a",
	dark1        = "#005515",
	dark2        = "#008020",
	mid          = "#00aa2b",
	neon         = "#00d436",
	light1       = "#1add45",
	light2       = "#40e65f",
	light3       = "#6bf07f",
	light4       = "#95f99f",
	light5       = "#b3ffb3",
	light6       = "#d6ffd6",
}

-- =============================================================================
local highlights        = {

	------------------------- BASE UI -------------------------
	Normal                            = { bg = colors.black, fg = colors.neon },
	NormalFloat                       = { bg = colors.black, fg = colors.neon },
	NonText                           = { fg = colors.dark0 },
	EndOfBuffer                       = { fg = colors.black },
	LineNr                            = { fg = colors.dark2 },
	CursorLine                        = { bg = colors.dark0 },
	CursorLineNr                      = { fg = colors.white, bold = true },
	Cursor                            = { bg = colors.cursor, fg = colors.cursor_fg },
	CursorColumn                      = { bg = colors.dark0 },
	Visual                            = { bg = colors.selection_bg, fg = colors.selection_fg },
	VisualNOS                         = { bg = colors.selection_bg, fg = colors.selection_fg },
	Search                            = { bg = colors.neon, fg = colors.black },
	IncSearch                         = { bg = colors.white, fg = colors.black },
	CurSearch                         = { bg = colors.light1, fg = colors.black, bold = true },
	MatchParen                        = { bg = colors.dark0, fg = colors.neon, bold = true },
	ColorColumn                       = { bg = colors.dark0 },
	SignColumn                        = { bg = colors.black },
	WinSeparator                      = { fg = colors.dark0 },
	FoldColumn                        = { bg = colors.black, fg = colors.gray },
	Folded                            = { bg = colors.dark0, fg = colors.mid },
	Conceal                           = { fg = colors.gray },
	SpecialKey                        = { fg = colors.dark1 },
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
	CommandLine                       = { bg = colors.black, fg = colors.neon },
	CmdlineMsg                        = { bg = colors.black, fg = colors.neon },

	------------------------- COMPLETION MENU -------------------------
	Pmenu                             = { bg = colors.dark0, fg = colors.white },
	PmenuSel                          = { bg = colors.neon, fg = colors.black, bold = true },
	PmenuSbar                         = { bg = colors.black },
	PmenuThumb                        = { bg = colors.dark0 },
	WildMenu                          = { bg = colors.neon, fg = colors.black, bold = true },

	------------------------- QUICKFIX -------------------------
	QuickFixLine                      = { bg = colors.dark0, fg = colors.white, bold = true },
	QuickFixList                      = { bg = colors.black, fg = colors.white },

	------------------------- DIFF -------------------------
	DiffAdd                           = { bg = "#0a2a0a" },
	DiffChange                        = { bg = "#1a2a0a" },
	DiffDelete                        = { bg = "#2a0a0a" },
	DiffText                          = { bg = "#0a3a0a" },
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
	Comment                           = { fg = colors.gray, italic = use_italic },
	Constant                          = { fg = colors.mid },
	String                            = { fg = colors.mid },
	Character                         = { fg = colors.mid },
	Number                            = { fg = colors.light1 },
	Boolean                           = { fg = colors.neon },
	Float                             = { fg = colors.light1 },

	Identifier                        = { fg = colors.white },
	Function                          = { fg = colors.neon, bold = true },
	Statement                         = { fg = colors.neon },
	Conditional                       = { fg = colors.neon },
	Repeat                            = { fg = colors.neon },
	Label                             = { fg = colors.light1 },
	Operator                          = { fg = colors.light2 },
	Keyword                           = { fg = colors.neon },
	Exception                         = { fg = colors.neon },

	PreProc                           = { fg = colors.light3 },
	Include                           = { fg = colors.light3 },
	Define                            = { fg = colors.light3 },
	Macro                             = { fg = colors.light3 },
	PreCondit                         = { fg = colors.light3 },

	Type                              = { fg = colors.neon },
	StorageClass                      = { fg = colors.neon },
	Structure                         = { fg = colors.neon },
	Typedef                           = { fg = colors.neon },

	Special                           = { fg = colors.light2 },
	SpecialChar                       = { fg = colors.light2 },
	Tag                               = { fg = colors.light4 },
	Delimiter                         = { fg = colors.light3 }, -- [] () {} em verde claro
	SpecialComment                    = { fg = colors.gray, italic = true },
	Debug                             = { fg = colors.light2 },
	Todo                              = { fg = colors.light2, italic = true },
	Error                             = { bg = colors.white, fg = colors.black },
	Underlined                        = { underline = true },

	------------------------- LSP DIAGNOSTICS -------------------------
	DiagnosticError                   = { fg = colors.white },
	DiagnosticWarn                    = { fg = colors.light2 },
	DiagnosticInfo                    = { fg = colors.mid },
	DiagnosticHint                    = { fg = colors.light2 },
	DiagnosticUnderlineError          = { sp = colors.white, undercurl = true },
	DiagnosticUnderlineWarn           = { sp = colors.light2, undercurl = true },
	DiagnosticUnderlineInfo           = { sp = colors.mid, undercurl = true },
	DiagnosticUnderlineHint           = { sp = colors.light2, undercurl = true },
	DiagnosticSignError               = { fg = colors.white },
	DiagnosticSignWarn                = { fg = colors.light2 },
	DiagnosticSignInfo                = { fg = colors.mid },
	DiagnosticSignHint                = { fg = colors.light2 },
	DiagnosticVirtualTextError        = { fg = colors.white, bg = colors.dark0 },
	DiagnosticVirtualTextWarn         = { fg = colors.light2, bg = colors.dark0 },
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
	["@comment"]                      = { link = "Comment" },
	["@comment.todo"]                 = { fg = colors.light2, italic = true },
	["@error"]                        = { link = "Error" },

	["@string"]                       = { link = "String" },
	["@string.escape"]                = { fg = colors.light2 },
	["@string.regex"]                 = { fg = colors.mid },
	["@character"]                    = { link = "Character" },
	["@number"]                       = { link = "Number" },
	["@float"]                        = { link = "Float" },
	["@boolean"]                      = { link = "Boolean" },

	["@constant"]                     = { link = "Constant" },
	["@constant.builtin"]             = { fg = colors.neon },
	["@constant.macro"]               = { fg = colors.light3 },

	["@type"]                         = { fg = colors.neon },
	["@type.builtin"]                 = { fg = colors.light2 },
	["@type.definition"]              = { fg = colors.neon },

	["@keyword"]                      = { fg = colors.neon },
	["@keyword.function"]             = { fg = colors.neon },
	["@keyword.return"]               = { fg = colors.neon },
	["@keyword.conditional"]          = { fg = colors.neon },
	["@keyword.repeat"]               = { fg = colors.neon },
	["@keyword.exception"]            = { fg = colors.neon },

	["@function"]                     = { fg = colors.neon },
	["@function.builtin"]             = { fg = colors.light1 },
	["@function.macro"]               = { fg = colors.light3 },
	["@method"]                       = { fg = colors.neon },
	["@constructor"]                  = { fg = colors.light2 },

	["@variable"]                     = { fg = colors.white },
	["@variable.builtin"]             = { fg = colors.light2 },
	["@variable.parameter"]           = { fg = colors.light4 },

	["@property"]                     = { fg = colors.light4 },
	["@field"]                        = { fg = colors.light4 },

	["@operator"]                     = { fg = colors.light2 },
	["@punctuation"]                  = { fg = colors.light3 }, -- delimitadores verdes
	["@punctuation.delimiter"]        = { fg = colors.light3 },
	["@punctuation.bracket"]          = { fg = colors.light3 },
	["@punctuation.special"]          = { fg = colors.light2 },

	["@tag"]                          = { fg = colors.light4 },
	["@tag.delimiter"]                = { fg = colors.mid },
	["@tag.attribute"]                = { fg = colors.neon },

	["@namespace"]                    = { fg = colors.neon },
	["@module"]                       = { fg = colors.neon },

	["@text"]                         = { fg = colors.neon },
	["@text.strong"]                  = { fg = colors.white, bold = true },
	["@text.emphasis"]                = { fg = colors.light2, italic = use_italic },
	["@text.underline"]               = { underline = true },
	["@text.strike"]                  = { strikethrough = true },
	["@text.title"]                   = { fg = colors.white, bold = true },
	["@text.literal"]                 = { fg = colors.mid },
	["@text.uri"]                     = { fg = colors.neon, underline = true },
	["@text.math"]                    = { fg = colors.light3 },
	["@text.reference"]               = { fg = colors.neon },
	["@text.environment"]             = { fg = colors.neon },
	["@text.environment.name"]        = { fg = colors.neon },
	["@text.todo"]                    = { fg = colors.light2, italic = true },
	["@text.note"]                    = { fg = colors.light2 },
	["@text.warning"]                 = { fg = colors.white },
	["@text.danger"]                  = { fg = colors.white },

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
	TelescopeMatching                 = { fg = colors.neon },
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
	CmpItemAbbr                       = { fg = colors.neon },
	CmpItemAbbrMatch                  = { fg = colors.white, bold = true },
	CmpItemAbbrMatchFuzzy             = { fg = colors.light2 },
	CmpItemKind                       = { fg = colors.neon },
	CmpItemMenu                       = { fg = colors.gray },
	CmpItemKindDefault                = { fg = colors.neon },
	CmpItemKindKeyword                = { fg = colors.neon },
	CmpItemKindVariable               = { fg = colors.white },
	CmpItemKindField                  = { fg = colors.light4 },
	CmpItemKindProperty               = { fg = colors.light4 },
	CmpItemKindFunction               = { fg = colors.neon },
	CmpItemKindMethod                 = { fg = colors.neon },
	CmpItemKindConstructor            = { fg = colors.light2 },
	CmpItemKindClass                  = { fg = colors.neon },
	CmpItemKindInterface              = { fg = colors.light2 },
	CmpItemKindStruct                 = { fg = colors.neon },
	CmpItemKindEnum                   = { fg = colors.neon },
	CmpItemKindEnumMember             = { fg = colors.light2 },
	CmpItemKindConstant               = { fg = colors.neon },
	CmpItemKindTypeParameter          = { fg = colors.light3 },
	CmpItemKindSnippet                = { fg = colors.mid },
	CmpItemKindText                   = { fg = colors.light2 },
	CmpItemKindUnit                   = { fg = colors.neon },
	CmpItemKindFolder                 = { fg = colors.neon },
	CmpItemKindFile                   = { fg = colors.neon },
	CmpItemKindReference              = { fg = colors.neon },
	CmpItemKindColor                  = { fg = colors.light2 },
	CmpItemKindValue                  = { fg = colors.neon },
	CmpItemKindOperator               = { fg = colors.light2 },

	------------------------- PLUGIN: nvim-tree -------------------------
	NvimTreeNormal                    = { bg = colors.black, fg = colors.neon },
	NvimTreeEndOfBuffer               = { fg = colors.black },
	NvimTreeRootFolder                = { fg = colors.neon, bold = true },
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
	lualine_a_normal                  = { bg = colors.neon, fg = colors.black, bold = true },
	lualine_b_normal                  = { bg = colors.black, fg = colors.neon },
	lualine_c_normal                  = { bg = colors.black, fg = colors.neon },
	lualine_a_insert                  = { bg = colors.light2, fg = colors.black, bold = true },
	lualine_b_insert                  = { bg = colors.black, fg = colors.neon },
	lualine_c_insert                  = { bg = colors.black, fg = colors.neon },
	lualine_a_visual                  = { bg = colors.selection_bg, fg = colors.white, bold = true },
	lualine_b_visual                  = { bg = colors.black, fg = colors.neon },
	lualine_c_visual                  = { bg = colors.black, fg = colors.neon },
	lualine_a_replace                 = { bg = colors.white, fg = colors.black, bold = true },
	lualine_b_replace                 = { bg = colors.black, fg = colors.neon },
	lualine_c_replace                 = { bg = colors.black, fg = colors.neon },
	lualine_a_command                 = { bg = colors.mid, fg = colors.black, bold = true }, -- COMMAND em verde
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
	GitSignsChange                    = { fg = colors.neon },
	GitSignsDelete                    = { fg = colors.white },
	GitSignsAddNr                     = { fg = colors.light2 },
	GitSignsChangeNr                  = { fg = colors.neon },
	GitSignsDeleteNr                  = { fg = colors.white },
	GitSignsAddLn                     = { bg = "#0a2a0a" },
	GitSignsChangeLn                  = { bg = "#1a2a0a" },
	GitSignsDeleteLn                  = { bg = "#2a0a0a" },
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
	WhichKeyGroup                     = { fg = colors.neon },
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

for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
