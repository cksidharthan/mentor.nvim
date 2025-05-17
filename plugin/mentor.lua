if vim.g.loaded_mentor then
	return
end
vim.g.loaded_mentor = true

-- Show random message on startup with a delay
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.defer_fn(function()
			-- Use protected call to handle any errors
			local status, err = pcall(function()
				local mentor = require("mentor")
				if type(mentor) == "table" and type(mentor.show_random_message) == "function" then
					mentor.show_random_message()
				else
					vim.notify("Mentor plugin error: Module incorrectly structured", vim.log.levels.ERROR)
				end
			end)

			if not status then
				vim.notify("Mentor plugin error: " .. tostring(err), vim.log.levels.ERROR)
			end
		end, 500) -- 500ms delay
	end,
	group = vim.api.nvim_create_augroup("MentorPlugin", { clear = true }),
})

-- Define the :Mentor command
vim.api.nvim_create_user_command('Mentor', function()
  -- Use protected call to handle any errors
  local status, err = pcall(function()
    local mentor = require('mentor')
    if type(mentor) == "table" and type(mentor.show_random_message) == "function" then
      mentor.show_random_message()
    else
      vim.notify("Mentor plugin error: Module incorrectly structured", vim.log.levels.ERROR)
    end
  end)

  if not status then
    vim.notify("Mentor plugin error: " .. tostring(err), vim.log.levels.ERROR)
  end
end, {})
