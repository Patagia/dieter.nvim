local colors = {
	light = {
		foreground = "#202020",
		intense = "#000000",
		primary = "#ff0000",
		secondary = "#00ff00",
		diagnostic_error = "#ff0038",
		diagnostic_warning = "#ff7700",
		diagnostic_info = "#47eae0",
		diagnostic_hint = "#47eae0",
		diff_add = "#00ff77",
		diff_change = "#47eae0",
		diff_delete = "#ff0038",
		highlight_subtle = "#f0f0f0",
		dimmed = "#cccccc",
	},

	dark = {
		foreground = "#b2b2b2",
		intense = "#e7e7e7",
		primary = "#00ff00",
		secondary = "#555555",
		diagnostic_error = "#ff0038",
		diagnostic_warning = "#ff7700",
		diagnostic_info = "#47eae0",
		diagnostic_hint = "#47eae0",
		diff_add = "#00ff77",
		diff_change = "#47eae0",
		diff_delete = "#ff0038",
		dimmed = "#666666",
		highlight_subtle = "#101010",
	},
}

local c = colors[vim.o.background]

local theme = {
	Constant = { fg = c.foreground },
	Delimiter = { fg = c.foreground },
	Identifier = { fg = c.foreground },
	Normal = { fg = c.foreground },
	Keyword = { fg = c.foreground, bold = true },
	Operator = { fg = c.foreground },
	Special = { fg = c.foreground },
	String = { fg = c.foreground },
	Type = { fg = c.foreground },
	["@function"] = { fg = c.foreground },
	["@special"] = { fg = c.foreground },
	["@variable"] = { fg = c.foreground },

	-- UI Elements
	CursorLine = { bg = c.highlight_subtle },
	LineNr = { fg = c.dimmed, italic = true },
	IndentLine = { fg = "#ffffff" },
	IndentLineCurrent = { fg = c.dimmed },
}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

for group, hl in pairs(theme) do
	vim.api.nvim_set_hl(0, group, hl)
end

vim.g.colors_name = "sumi-e"
