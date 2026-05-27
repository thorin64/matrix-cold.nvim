-- Clears previous highlights and resets syntax
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

-- Sets the official theme name
vim.g.colors_name = "matrix-cold"

-- Configuration toggles
local use_italic = vim.g.matrix_italic ~= false

-- Color dictionary (Absolute Black to Pure White, with green ramp and grays for contrast)
local colors = {
	black       = "#000000",
	dark_green  = "#003311",
	mid_green   = "#008822",
	green       = "#00aa33",
	neon_green  = "#00ff41",
	light_green = "#88ffaa",
	white       = "#ffffff",
	gray        = "#666666",
	light_gray  = "#aaaaaa",
}

-- Highlight groups mapping
local highlights = {
	-- Base Interface
	Normal                = { bg = colors.black, fg = colors.neon_green },
	NonText               = { fg = colors.dark_green },
	EndOfBuffer           = { fg = colors.black },
	LineNr                = { fg = colors.dark_green },
	CursorLine            = { bg = "#001105" },
	CursorLineNr          = { fg = colors.white, bold = true },
	Cursor                = { bg = colors.white, fg = colors.black },
	Visual                = { bg = colors.dark_green, fg = colors.white },
	Search                = { bg = colors.neon_green, fg = colors.black },
	IncSearch             = { bg = colors.white, fg = colors.black },
	MatchParen            = { bg = colors.dark_green, fg = colors.white, bold = true },
	ColorColumn           = { bg = "#001105" },
	SignColumn            = { bg = colors.black },
	WinSeparator          = { fg = colors.dark_green },

	-- Alerts and Messages
	ErrorMsg              = { bg = colors.white, fg = colors.black },
	WarningMsg            = { fg = colors.white, bold = true },
	MoreMsg               = { fg = colors.neon_green, bold = true },
	Question              = { fg = colors.neon_green, bold = true },

	-- Floating Menu (Autocomplete)
	Pmenu                 = { bg = "#001105", fg = colors.green },
	PmenuSel              = { bg = colors.neon_green, fg = colors.black, bold = true },
	PmenuSbar             = { bg = colors.black },
	PmenuThumb            = { bg = colors.dark_green },

	-- Code Syntax
	Comment               = { fg = colors.gray, italic = use_italic },
	Constant              = { fg = colors.light_green },
	String                = { fg = colors.green },
	Number                = { fg = colors.light_gray },
	Boolean               = { fg = colors.light_gray },
	Identifier            = { fg = colors.neon_green },
	Function              = { fg = colors.neon_green, bold = true },
	Statement             = { fg = colors.neon_green, bold = true },
	Operator              = { fg = colors.neon_green },
	Keyword               = { fg = colors.neon_green, bold = true },
	PreProc               = { fg = colors.mid_green },
	Type                  = { fg = colors.green },
	Special               = { fg = colors.white },
	Error                 = { bg = colors.white, fg = colors.black },
	Todo                  = { bg = colors.dark_green, fg = colors.white, bold = true },

	-- Treesitter Integration
	["@comment"]          = { link = "Comment" },
	["@string"]           = { link = "String" },
	["@function"]         = { link = "Function" },
	["@keyword"]          = { link = "Keyword" },
	["@variable"]         = { fg = colors.neon_green },
	["@operator"]         = { link = "Operator" },
	["@type"]             = { link = "Type" },
	["@number"]           = { link = "Number" },

	-- Telescope Integration
	TelescopeBorder       = { fg = colors.dark_green, bg = colors.black },
	TelescopePromptBorder = { fg = colors.neon_green, bg = colors.black },
	TelescopeNormal       = { fg = colors.neon_green, bg = colors.black },
	TelescopeSelection    = { bg = colors.dark_green, fg = colors.white },
}

-- Applies configurations to Neovim
for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
