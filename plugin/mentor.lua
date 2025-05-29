-- plugin/mentor.lua
if vim.g.loaded_mentor then
  return
end
vim.g.loaded_mentor = true

-- Show random message on startup with a delay
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      pcall(require("mentor").show_random_message)
    end, 500) -- 500ms delay
  end,
  group = vim.api.nvim_create_augroup("MentorPlugin", { clear = true }),
})

-- Define the :Mentor command
vim.api.nvim_create_user_command('Mentor', function()
  pcall(require('mentor').show_random_message)
end, {})
