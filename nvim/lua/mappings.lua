local merge = function(first_table, second_table)
	if (second_table == nil) then
		return first_table
	end
	for k,v in pairs(second_table) do first_table[k] = v end
	return first_table
end
local map = function(mode, key, result, opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    merge({noremap = true, silent = true}, opts)
  )
end
map('n', '<C-Tab>', ':bnext <CR>')
map('n', '<C-S-Tab>', ':bprev <CR>')
map('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
map('n', '<C-n>', ':NvimTreeToggle <CR>', {})
