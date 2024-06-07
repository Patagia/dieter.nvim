local hsl = require("dieter.hsl").hslToHex

local colors = {
	light = {
		background = hsl(240, 100, 100),
		foreground = hsl(0, 0, 13),

		string = hsl(96, 50, 33),
		comment = hsl(230, 66, 40),
		comment_error = hsl(2, 85, 40),

		diagnostic_error = hsl(347, 80, 45),
		diagnostic_warning = hsl(30, 100, 50),
		diagnostic_info = hsl(145, 80, 30),
		diagnostic_hint = hsl(145, 80, 30),

		popup_error_bg = hsl(0, 90, 99),
		popup_warning_bg = hsl(27, 90, 99),
		popup_info_bg = hsl(112, 90, 99),
		popup_hint_bg = hsl(112, 90, 99),

		add = hsl(84, 50, 80),
		add_quarter = hsl(84, 80, 95),
		change = hsl(41, 80, 80),
		change_quarter = hsl(224, 100, 85),
		delete = hsl(350, 100, 40),
		delete_quarter = hsl(350, 100, 85),

		dialog_bg = hsl(224, 5, 92),
		selection = hsl(270, 75, 92),
		highlight_subtle = hsl(0, 0, 94),
		highlight_intense = hsl(42, 100, 30),
		dimmed = hsl(0, 0, 80),
		dimmed_subtle = hsl(0, 0, 20),
	},

	dark = {
		background = hsl(216, 28, 7),
		foreground = hsl(0, 0, 80),
		dimmed = hsl(0, 0, 35),
		dimmed_subtle = hsl(0, 0, 70),
		highlight_subtle = hsl(0, 0, 6),
		highlight_intense = hsl(58, 100, 60),

		string = hsl(96, 50, 70),
		comment = hsl(220, 50, 60),
		comment_error = hsl(2, 85, 50),

		diagnostic_error = hsl(353, 100, 45),
		diagnostic_warning = hsl(30, 100, 50),
		diagnostic_info = hsl(176, 80, 60),
		diagnostic_hint = hsl(176, 80, 60),

		popup_error_bg = hsl(0, 95, 7),
		popup_warning_bg = hsl(27, 95, 7),
		popup_info_bg = hsl(112, 95, 7),
		popup_hint_bg = hsl(112, 95, 7),

		add = hsl(100, 100, 12),
		add_quarter = hsl(84, 80, 15),
		change = hsl(41, 100, 15),
		change_quarter = hsl(224, 100, 15),
		delete = hsl(350, 100, 40),
		delete_quarter = hsl(350, 100, 15),

		dialog_bg = hsl(224, 5, 12),

		selection = hsl(270, 50, 33),
	},
}

local c = colors[vim.o.background]

local theme = {
	Normal = { fg = c.foreground, bg = c.background },

	Constant = { link = "NormalNC" },
	Delimiter = { link = "NormalNC" },
	Identifier = { link = "NormalNC" },
	Keyword = { fg = c.foreground, bold = true },
	Operator = { link = "NormalNC" },
	Special = { link = "NormalNC" },
	Type = { link = "NormalNC" },

	String = { fg = c.string },

	Comment = { fg = c.comment, italic = true, bold = true },
	CommentError = { fg = c.comment_error, italic = true, bold = true },
	["@comment.note"] = { link = "Comment" },
	["@comment.todo"] = { link = "CommentError" },
	["@comment.error"] = { link = "CommentError" },
	["@comment.warning"] = { link = "CommentError" },

	DiffAdd = { fg = c.add, bg = c.add_quarter },
	GitSignsAdd = { fg = c.add, bg = c.background },
	GitSignsAddNr = { link = "DiffAdd" },
	DiffChange = { fg = c.change, bg = c.change_quarter },
	GitSignsChange = { fg = c.change, bg = c.background },
	GitSignsChangeNr = { link = "DiffChange" },
	DiffDelete = { fg = c.delete, bg = c.delete_quarter },
	GitSignsDelete = { fg = c.delete, bg = c.background },
	GitSignsDeleteNr = { link = "DiffDelete" },

	-- Treesitter
	["@function"] = { link = "NormalNC" },
	["@special"] = { link = "NormalNC" },
	["@variable"] = { link = "NormalNC" },
	["@lsp.type.variable"] = { fg = c.dimmed_subtle },

	-- UI Elements
	CursorLine = { bg = c.highlight_subtle },

	DiagnosticError = { fg = c.diagnostic_error, italic = true },
	DiagnosticFloatingError = { fg = c.diagnostic_error, bg = c.popup_error_bg },
	DiagnosticFloatingWarn = { fg = c.diagnostic_warning, bg = c.popup_warning_bg },
	DiagnosticFloatingInfo = { fg = c.diagnostic_info, bg = c.popup_info_bg },
	DiagnosticFloatingHint = { fg = c.diagnostic_hint, bg = c.popup_hint_bg },
	DiagnosticUnderlineError = { fg = c.diagnostic_error, undercurl = true },
	DiagnosticUnderlineWarn = { fg = c.diagnostic_warn, undercurl = true },
	DiagnosticUnderlineInfo = { fg = c.diagnostic_info, undercurl = true },
	DiagnosticUnderlinehint = { fg = c.diagnostic_hint, undercurl = true },

	DiagnosticSignError = { fg = c.diagnostic_error },
	DiagnosticSignHint = { fg = c.diagnostic_hint },
	DiagnosticSignInfo = { fg = c.diagnostic_info },
	DiagnosticSignWarn = { fg = c.diagnostic_warning },
	LineNr = { fg = c.dimmed, italic = true },
	IndentLine = { fg = c.background },
	IndentLineCurrent = { fg = c.dimmed },
	TreesitterContext = { reverse = true },
	TreesitterContextLineNumber = { bg = c.dimmed, reverse = true, italic = true },
	InclineNormal = { bg = c.background },
	InclineNormalNC = { bg = c.background },

	WinSeparator = { bg = c.dialog_bg },
	NormalFloat = { bg = c.dialog_bg },
	Title = { fg = c.foreground, bold = true },

	TelescopeNormal = { fg = c.foreground, bg = c.background },
	TelescopeBorder = { bold = true },
	TelescopeSelection = { reverse = true },
	TelescopeResultsComment = { fg = c.foreground, italic = true },

	Visual = { bg = c.selection },
	LspReferenceText = { fg = c.highlight_intense, undercurl = true },
}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

for group, hl in pairs(theme) do
	vim.api.nvim_set_hl(0, group, hl)
end

vim.g.colors_name = "dieter"
