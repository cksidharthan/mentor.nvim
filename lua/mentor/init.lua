local M = {}

function M.show_random_message()
	-- Find messages.json file
	local messages_path
	for _, path in ipairs(vim.api.nvim_get_runtime_file("data/messages.json", true)) do
		if path:match("mentor") then -- Make sure it's our plugin's file
			messages_path = path
			break
		end
	end

	if not messages_path then
		-- Fall back to embedded messages
		return M.use_embedded_messages()
	end

	-- Read and parse the JSON file
	local file = io.open(messages_path, "r")
	if not file then
		return M.use_embedded_messages()
	end

	local content = file:read("*all")
	file:close()

	local status, data = pcall(vim.fn.json_decode, content)
	if not status or type(data) ~= "table" or type(data.messages) ~= "table" then
		return M.use_embedded_messages()
	end

	-- Display a random message
	M.display_random_message(data.messages)
	return true
end

-- Fallback to embedded messages
function M.use_embedded_messages()
	local embedded_messages = {
		"Happy coding today!",
		"Remember to take breaks",
		"Vim tip: Use 'ciw' to change inner word",
		"Did you know? Neovim has built-in LSP support",
		"Don't forget to commit your changes",
		"Stay hydrated while coding!",
	}

	M.display_random_message(embedded_messages)
	return true
end

-- Display a random message from the given list
function M.display_random_message(messages)
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

		-- Use vim.notify directly
		vim.notify(display_text, vim.log.levels.INFO)
	end
end

-- Make sure to return the module table at the end
return M
