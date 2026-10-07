require("config.options")
require("config.keymaps")

require("config.lazy")

-- nvim's built in .tf detection can infer tf := `TinyFugue` instead of terraform
vim.filetype.add({
  extension = {
    tf = "terraform",
    tfvars = "terraform-vars",
    tofu = "terraform",
  },
})

vim.cmd("syntax enable")

vim.treesitter.language.register("terraform", "terraform-vars")

local parser_dirs = {
  vim.fn.stdpath("data") .. "/site/parser",
  -- Existing parser artifacts from the old nvim-treesitter install. This does
  -- not load the plugin; it only lets Neovim use the compiled parser files.
  vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser",
}

local function load_treesitter_parser(filetype)
  local lang = vim.treesitter.language.get_lang(filetype)
  if not lang then
    return nil
  end

  for _, dir in ipairs(parser_dirs) do
    local parser = ("%s/%s.so"):format(dir, lang)
    if vim.uv.fs_stat(parser) then
      return vim.treesitter.language.add(lang, { path = parser })
    end
  end

  return vim.treesitter.language.add(lang)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("curlin-treesitter-start", { clear = true }),
  callback = function(event)
    local filetype = vim.bo[event.buf].filetype
    local lang = vim.treesitter.language.get_lang(filetype)
    if not lang then
      return
    end

    local has_parser = load_treesitter_parser(filetype)
    local has_highlights = vim.treesitter.query.get(lang, "highlights") ~= nil
    if has_parser and has_highlights then
      pcall(vim.treesitter.start, event.buf, lang)
    else
      vim.bo[event.buf].syntax = filetype
    end
  end,
})

vim.lsp.enable({ "basedpyright", "ruff", "tofu_ls", "lua_ls", "dbt" })

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("curlin-lsp-attach", { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = true,
      })

      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, { buffer = event.buf, desc = "LSP: Completion" })
    end

    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
  end,
})

vim.diagnostic.config({
  float = {
    source = true, -- prefix floating lsp diagnostic window messages with the source lsp, e.g. `basedpyright: ...`
  },
})

vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
