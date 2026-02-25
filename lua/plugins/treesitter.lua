return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Some versions moved things around. 
    -- This check ensures the module exists before calling it.
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup({
      ensure_installed = { "c", "python", "rust", "go", "zig"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
