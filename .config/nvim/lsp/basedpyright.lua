return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
  },
  settings = {
    basedpyright = {
      disableOrganizeImports = true, -- (using Ruff)
    },
    python = {
      analysis = {
        ignore = { '*' }, -- (using Ruff)
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
