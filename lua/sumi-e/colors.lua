local colors = {
	white = "#ffffff",
	black = "#000000",
	gray500 = "#7f7f7f",
}

function _colors_dark()
	colors.bg = "#11171d"
	colors.fg = "#e3e0cd"
	colors.string = colors.gray500
	colors.comment = colors.gray500
end

function _colors_light()
	colors.bg = "#ffffff"
	colors.fg = "#000000"
end

function colors.generate()
	if vim.o.background == "dark" then
		_colors_dark()
	else
		_colors_light()
	end
end

return colors
