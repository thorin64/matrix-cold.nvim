-- colors/matrix-cold.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "matrix-cold"

-- Controle de itálico via global
local use_italic = vim.g.matrix_italic ~= false

-- Paleta Estrita (Preto, Branco, Escala de Verdes e Cinza para código morto)
local colors = {
	black       = "#000000",
	gray        = "#555555", -- Comentários
	dark_green  = "#003311", -- Bordas e fundos inativos
	olive_green = "#007722", -- Números, Booleanos e Constantes
	mid_green   = "#00aa33", -- Strings
	neon_green  = "#00ff41", -- Texto base, Funções, Palavras-chave
	white       = "#ffffff", -- Erros, Cursores, Títulos de Pop-ups
}

local highlights = {
	-- Interface Base
	Normal                   = { bg = colors.black, fg = colors.neon_green },
	NonText                  = { fg = colors.dark_green },
	EndOfBuffer              = { fg = colors.black },
	LineNr                   = { fg = colors.dark_green },
	CursorLine               = { bg = "#001105" },
	CursorLineNr             = { fg = colors.white, bold = true },
	Cursor                   = { bg = colors.white, fg = colors.black },
	Visual                   = { bg = colors.dark_green, fg = colors.white },
	Search                   = { bg = colors.neon_green, fg = colors.black },
	IncSearch                = { bg = colors.white, fg = colors.black },
	MatchParen               = { bg = colors.dark_green, fg = colors.white, bold = true },
	ColorColumn              = { bg = "#001105" },
	SignColumn               = { bg = colors.black },
	WinSeparator             = { fg = colors.dark_green },

	-- Janelas Flutuantes (LSP Hovers, Pop-ups)
	NormalFloat              = { bg = colors.black, fg = colors.neon_green },
	FloatBorder              = { fg = colors.dark_green, bg = colors.black },
	FloatTitle               = { fg = colors.white, bg = colors.black, bold = true },

	-- Alertas Básicos
	ErrorMsg                 = { bg = colors.white, fg = colors.black },
	WarningMsg               = { fg = colors.white, bold = true },
	MoreMsg                  = { fg = colors.neon_green, bold = true },
	Question                 = { fg = colors.neon_green, bold = true },

	-- Menu de Autocomplete (Pmenu)
	Pmenu                    = { bg = "#001105", fg = colors.mid_green },
	PmenuSel                 = { bg = colors.neon_green, fg = colors.black, bold = true },
	PmenuSbar                = { bg = colors.black },
	PmenuThumb               = { bg = colors.dark_green },

	-- Sintaxe Nativa
	Comment                  = { fg = colors.gray, italic = use_italic },
	Constant                 = { fg = colors.olive_green },
	String                   = { fg = colors.mid_green },
	Number                   = { fg = colors.olive_green },
	Boolean                  = { fg = colors.olive_green },
	Identifier               = { fg = colors.neon_green },
	Function                 = { fg = colors.neon_green, bold = true },
	Statement                = { fg = colors.neon_green, bold = true },
	Operator                 = { fg = colors.neon_green },
	Keyword                  = { fg = colors.neon_green, bold = true },
	PreProc                  = { fg = colors.mid_green },
	Type                     = { fg = colors.mid_green },
	Special                  = { fg = colors.white },
	Error                    = { bg = colors.white, fg = colors.black },
	Todo                     = { bg = colors.dark_green, fg = colors.white, bold = true },

	-- Diagnósticos LSP (Substituição definitiva dos rosas/laranjas)
	DiagnosticError          = { fg = colors.white },
	DiagnosticWarn           = { fg = colors.neon_green },
	DiagnosticInfo           = { fg = colors.mid_green },
	DiagnosticHint           = { fg = colors.olive_green },
	DiagnosticUnderlineError = { sp = colors.white, underline = true },
	DiagnosticUnderlineWarn  = { sp = colors.neon_green, underline = true },
	DiagnosticUnderlineInfo  = { sp = colors.mid_green, underline = true },
	DiagnosticUnderlineHint  = { sp = colors.olive_green, underline = true },

	-- Integração Treesitter
	["@comment"]             = { link = "Comment" },
	["@string"]              = { link = "String" },
	["@function"]            = { link = "Function" },
	["@keyword"]             = { link = "Keyword" },
	["@variable"]            = { fg = colors.neon_green },
	["@operator"]            = { link = "Operator" },
	["@type"]                = { link = "Type" },
	["@number"]              = { link = "Number" },
	["@boolean"]             = { link = "Boolean" },
	["@constant"]            = { link = "Constant" },

	-- Integração Telescope
	TelescopeBorder          = { fg = colors.dark_green, bg = colors.black },
	TelescopePromptBorder    = { fg = colors.dark_green, bg = colors.black },
	TelescopeTitle           = { fg = colors.white, bg = colors.black, bold = true },
	TelescopePromptTitle     = { fg = colors.white, bg = colors.black, bold = true },
	TelescopeNormal          = { fg = colors.neon_green, bg = colors.black },
	TelescopeSelection       = { bg = colors.dark_green, fg = colors.white },
	TelescopeMatching        = { fg = colors.white, bold = true },
}

-- Aplicação do Tema
for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
