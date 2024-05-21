-- File: lua/helpers/dap-helper.lua

local M = {}

-- Function to check if a file exists
function M.file_exists(file_path)
    local file = io.open(file_path, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

-- Function to read a file
function M.read_file(file_path)
    local file = io.open(file_path, "r") -- Open the file in read mode
    if not file then
        print("Could not open file: " .. file_path)
        return nil
    end
    local content = file:read("*a") -- Read the entire file contents
    file:close() -- Close the file
    return content
end

return M

