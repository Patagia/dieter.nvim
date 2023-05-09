local colors = require("sumi-e.colors")
local config = require("sumi-e.config")
local sumi = {}

local function set_groups()
	local groups = {
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { bg = colors.bg },
		String = { fg = colors.string, italic = true },
		Comment = { fg = colors.comment, bold = true, italic = true },
	}

	groups =
		vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

--- Apply user settings.
---@param values table
function sumi.setup(values)
	setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

--- Set the colorscheme.
function sumi.colorscheme()
	if vim.version().minor < 8 then
		vim.notify(
			"Neovim 0.8+ is required for sumi-e colorscheme",
			vim.log.levels.ERROR,
			{ title = "Sumi-e colorscheme" }
		)
		return
	end

	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
	vim.o.termguicolors = true
	vim.g.colors_name = "sumi-e"

	colors.generate()
	set_groups()
end

return sumi
