return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true, -- Bật nền trong suốt
		})
		vim.cmd.colorscheme("catppuccin")

		-- Xóa nền của Normal, NonText, và EndOfBuffer để thấy hình nền WezTerm
		vim.cmd [[
			highlight Normal guibg=NONE ctermbg=NONE
			highlight NonText guibg=NONE ctermbg=NONE
			highlight EndOfBuffer guibg=NONE ctermbg=NONE
		]]	
    end,
}
