return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    auto_install = true,
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "java",
      "json",
      "zig",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },

  config = function(_, opts)
    -- thêm dòng này
    require("nvim-treesitter.install").compilers = { "zig" }

    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup(opts)
  end,
}
