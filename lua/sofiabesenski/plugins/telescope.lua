local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end


telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-u>"] = actions.cycle_history_next,
        ["<C-r>"] = actions.cycle_history_prev,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = {"rg", "--files", "--sortr=modified"}
    }
  }
})


telescope.load_extension("fzf")
