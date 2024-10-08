local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
