require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = " ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_defaults = {
      horizontal = {
        width_padding = 0.08,
        height_padding = 0.1,
        preview_width = 0.45,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 15,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.1,
    border = {},
    --borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    color_devicons = true,
    use_less = true,
    -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    set_env = { ['COLORTERM'] = 'truecolor' },
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    file_previewer = require'telescope.previewers'.cat.new,
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new,
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    qflist_previewer = require'telescope.previewers'.qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}


