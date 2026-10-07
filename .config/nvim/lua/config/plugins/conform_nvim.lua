local function dbt_formatter(name, args)
  return {
    command = "dbt",
    args = args,
    cwd = function(_, ctx)
      return vim.fs.root(ctx.dirname, "dbt_project.yml")
    end,
    require_cwd = true,
    stdin = false,
    tmpfile_format = "conform." .. name .. "$RANDOM.$FILENAME",
  }
end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      formatters = {
        dbt_fix = dbt_formatter("dbt_fix", { "lint", "--fix", "--jinja-render-mode", "turbo", "$RELATIVE_FILEPATH" }),
        dbt_fmt = dbt_formatter("dbt_fmt", { "format", "--jinja-render-mode", "turbo", "$RELATIVE_FILEPATH" }),
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        sql = { "dbt_fix", "dbt_fmt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = { timeout_ms = 1600 },
    },
  },
}
