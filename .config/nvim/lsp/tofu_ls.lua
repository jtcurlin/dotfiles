return {
  cmd = { "tofu-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = {
    ".terraform",
    "main.tf",
    "versions.tf",
    "providers.tf",
  },
}
