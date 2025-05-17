# mentor.nvim

<p align="center">
	Bring joy and reminders to your coding sessions in NeoVim
</p>

<p align="center">
	<a href="https://github.com/cksidharthan/mentor.nvim/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/cksidharthan/mentor.nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/cksidharthan/mentor.nvim/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/cksidharthan/mentor.nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/cksidharthan/mentor.nvim">
		<img alt="Repo Size" src="https://img.shields.io/github/repo-size/cksidharthan/mentor.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

## 📋 Features

- Display random motivational messages or tips when you open Neovim or run the command `:Mentor`.
- Fallback to embedded messages if the external messages are not found or not valid.
- Simple and user-friendly command to fetch a random message.

## 📚 Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the plugin with your favorite package manager:

### Packer

```lua
use({
	"cksidharthan/mentor.nvim",
	config = function()
		require("mentor")
	end,
})
```

### Lazy.nvim:

```lua
{
    "cksidharthan/mentor.nvim",
    config = function()
        require("mentor")
    end,
}
```

### ⚙️ Configuration

mentor.nvim comes with the following built-in features:

No additional configuration is required for basic usage. Simply install the plugin and it will display a random message on startup or when the command is invoked.

### 🪴 Usage

- On startup, a random message will be displayed after a brief delay.
- You can manually trigger a random message by executing `:Mentor` in command mode.
Feel free to customize the messages in messages.json to suit your preferences!

