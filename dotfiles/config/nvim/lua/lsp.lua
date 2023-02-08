lsp_on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- ++ Moving around ++
  buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>gD', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)
  buf_set_keymap('n', '<leader>gt', '<cmd>lua require"telescope.builtin".lsp_type_definitions()<CR>', opts)
  buf_set_keymap('n', '<leader>go', '<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>', opts)

  -- ++ Information ++
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- ++ Actions ++
  buf_set_keymap('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  -- ++ Diagnostics ++
  buf_set_keymap('n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>gE', '<cmd>lua require"telescope.builtin".diagnostics()<CR>', opts)

  -- ++ Workspace ++
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  -- end
end
