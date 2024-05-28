local dap = require('dap')


local dapui = require("dapui")

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left" or "right"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

-- Automatically open the UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Virtual Text
require("nvim-dap-virtual-text").setup()


vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require\'dap\'.continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>B', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dr', '<cmd>lua require\'dap\'.repl.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dl', '<cmd>lua require\'dap\'.run_last()<CR>', { noremap = true, silent = true })


-- Adapters for codelldb
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/Users/jums/projects/nvim/codelldb-aarch64-darwin/extension/adapter/codelldb',
    args = {"--port", "${port}"},
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

local json = require('dkjson')
local uv = vim.loop

-- Function to read the config file
local function read_config_file(file_path)
    local fd = uv.fs_open(file_path, "r", 438)
    if not fd then return nil end
    local stat = uv.fs_fstat(fd)
    if not stat then return nil end
    local data = uv.fs_read(fd, stat.size, 0)
    uv.fs_close(fd)
    if not data then return nil end
    return json.decode(data)
end

-- Path to the config file
local config_file_path = vim.fn.getcwd() .. '/.dap-config/config.json'
local config = read_config_file(config_file_path)

-- Set up dap configurations based on the target_lang
if config then
    local target_lang = config.target_lang
    local dap_config = {
        name = config.config.name,
        type = config.config.type,
        request = config.config.request,
        program = config.config.program,
        cwd = config.config.cwd,
        stopOnEntry = config.config.stopOnEntry or false,
        args = config.config.args or {},
	sourceLanguages = config.config.sourceLanguages
    }

    if target_lang == "rust" then
        dap_config.initCommands = function()
            -- Find out where to look for the pretty printer Python module
            local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

            local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
            local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

            local commands = {}
            local file = io.open(commands_file, 'r')
            if file then
                for line in file:lines() do
                    table.insert(commands, line)
                end
                file:close()
            end
            table.insert(commands, 1, script_import)

            return commands
        end
        dap.configurations.rust = { dap_config }
    elseif target_lang == "c" then
        dap.configurations.c = { dap_config }
    elseif target_lang == "cpp" then
        dap.configurations.cpp = { dap_config }
    end
end



