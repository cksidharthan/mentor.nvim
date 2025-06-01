local M = {}

-- Default configuration
M.config = {
	tips = {},
	defaults = {
		enabled = true,
		skip_list = {},
	},
}

-- Basic built-in tips as fallback
local built_in_tips = {
	"Happy coding today!",
	"Remember to take breaks",
	"Vim tip: Use 'ciw' to change inner word",
	"Did you know? Neovim has built-in LSP support",
	"Don't forget to commit your changes",
	"Stay hydrated while coding!",
}

-- Setup function to configure the plugin
function M.setup(opts)
	opts = opts or {}

	-- Override with user options
	if opts.tips then
		M.config.tips = opts.tips
	end

	if opts.defaults then
		if opts.defaults.enabled ~= nil then
			M.config.defaults.enabled = opts.defaults.enabled
		end

		if opts.defaults.skip_list then
			M.config.defaults.skip_list = opts.defaults.skip_list
		end
	end
end

-- Check if a tip should be skipped
local function should_skip_tip(tip_text)
	for _, skip_item in ipairs(M.config.defaults.skip_list) do
		if tip_text == skip_item then
			return true
		end
	end
	return false
end

-- Get text from a message (either string or table)
local function get_message_text(message)
	if type(message) == "string" then
		return message
	elseif type(message) == "table" and message.text then
		return message.text
	end
	return nil
end

-- Load default messages from JSON file
local function load_default_tips()
	-- Try to find the messages.json file
	local messages_path
	for _, path in ipairs(vim.api.nvim_get_runtime_file("data/messages.json", true)) do
		if path:match("mentor") then
			messages_path = path
			break
		end
	end

	if not messages_path then
		return built_in_tips
	end

	-- Read the file
	local file = io.open(messages_path, "r")
	if not file then
		return built_in_tips
	end

	local content = file:read("*all")
	file:close()

	-- Parse JSON
	local status, data = pcall(vim.fn.json_decode, content)
	if not status or type(data) ~= "table" or type(data.messages) ~= "table" then
		return built_in_tips
	end

	-- Process messages, filtering out skipped ones
	local valid_tips = {}
	for _, msg in ipairs(data.messages) do
		local text = get_message_text(msg)
		if text and not should_skip_tip(text) then
			table.insert(valid_tips, text)
		end
	end

	return #valid_tips > 0 and valid_tips or built_in_tips
end

-- Display a random message
function M.show_random_message()
	-- Collect all messages to display
	local all_messages = {}

	-- Add user's custom tips
	for _, tip in ipairs(M.config.tips) do
		table.insert(all_messages, tip)
	end

	-- Add default tips if enabled
	if M.config.defaults.enabled then
		local default_messages = load_default_tips()
		for _, msg in ipairs(default_messages) do
			table.insert(all_messages, msg)
		end
	end

	-- If we have messages, show a random one
	if #all_messages > 0 then
		math.randomseed(os.time())
		local message = all_messages[math.random(#all_messages)]

		vim.notify(message, vim.log.levels.INFO)
		return true
	end

	return false
end

return M
