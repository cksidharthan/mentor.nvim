-- mentor.lua
local M = {}

-- Default configuration
M.config = {
	tips = {
		"Happy coding today!",
		"Remember to take breaks",
		"Vim tip: Use 'ciw' to change inner word",
		"Did you know? Neovim has built-in LSP support",
		"Don't forget to commit your changes",
		"Stay hydrated while coding!",
	},
	use_default = true,
}

-- Setup function to configure the plugin
function M.setup(opts)
	opts = opts or {}

	-- Override defaults with user options
	if opts.tips then
		M.config.tips = opts.tips
	end

	if opts.use_default ~= nil then
		M.config.use_default = opts.use_default
	end
end

-- Get messages from the JSON file
local function get_default_messages()
	-- Find messages.json file
	local messages_path
	for _, path in ipairs(vim.api.nvim_get_runtime_file("data/messages.json", true)) do
		if path:match("mentor") then
			messages_path = path
			break
		end
	end

	if not messages_path then
		return nil
	end

	-- Read and parse the JSON file
	local file = io.open(messages_path, "r")
	if not file then
		return nil
	end

	local content = file:read("*all")
	file:close()

	local status, data = pcall(vim.fn.json_decode, content)
	if not status or type(data) ~= "table" or type(data.messages) ~= "table" then
		return nil
	end

	return data.messages
end

-- Display a random message
function M.show_random_message()
	local messages = M.config.tips

	-- Try to load default messages if configured to do so
	if M.config.use_default then
		local default_messages = get_default_messages()
		if default_messages then
			messages = default_messages
		end
	end

	-- Display a random message
	if #messages > 0 then
		math.randomseed(os.time())
		local message = messages[math.random(#messages)]

		-- Handle both string messages and object messages
		local display_text
		if type(message) == "string" then
			display_text = message
		elseif type(message) == "table" and message.text then
			display_text = message.text
		else
			return false
		end

		vim.notify(display_text, vim.log.levels.INFO)
		return true
	end

	return false
end

return M
