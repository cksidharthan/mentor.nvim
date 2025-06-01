# mentor.nvim

<p align="center">
	Make your Neovim experience more enjoyable with mentor.nvim! 😎 A Neovim plugin that displays random tips and tricks messages when you open Neovim.
</p>

<p align="center">
	<a href="https://github.com/cksidharthan/mentor.nvim/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/cksidharthan/mentor.nvim?style=for-the-badge&logo=starship&color=C10CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/cksidharthan/mentor.nvim/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/cksidharthan/mentor.nvim?style=for-the-badge&logo=bilibili&color=F6E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/cksidharthan/mentor.nvim">
		<img alt="Repo Size" src="https://img.shields.io/github/repo-size/cksidharthan/mentor.nvim?color=%24DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

## 📋 Features

- Display random Neovim tips and tricks messages when you open Neovim or run the command `:Mentor`.
- Add your own custom tips to be displayed
- Fallback to embedded messages if the external messages file are not found or not valid.
- Simple and user-friendly command to fetch a random neovim tip or trick.

## 📦 Installation

Install the plugin with your favorite package manager:

### Packer

```lua
use({
	"cksidharthan/mentor.nvim",
	config = function()
		require("mentor").setup({
            -- your configuration options here
        })
	end,
})
```

### Lazy.nvim:

```lua
{
    "cksidharthan/mentor.nvim",
    config = function()
		require("mentor").setup({
            -- your configuration options here
        })
    end,
}
```

### ⚙️ Configuration

mentor.nvim comes with default settings, but you can customize it to your preferences like below:

```lua
require("mentor").setup({
    -- Your custom tips (optional)
    tips = {
        "My custom tip 1",
        "My custom tip 2",
    },
    
    -- Configure default tips behavior
    defaults = {
        enabled = true,  -- Set to false to disable all default tips
        -- Skip specific default tips (optional)
        skip_list = {
            "Tip you want to exclude",
            "Another tip to exclude",
        }
    }
})
```

#### Configuration options

| Option               | Description                                                                               | Type      | Default |
| -------------------- | ----------------------------------------------------------------------------------------- | --------- | ------- |
| `tips`               | A list of tips to be displayed                                                            | `table`   | `{}`    |
| `defaults.enabled`   | Whether to use default tips provided by the plugin                                        | `boolean` | `true`  |
| `defaults.skip_list` | Array of default tips to exclude from display (to ignore some tips from the default list) | `table`   | `{}`    |

No additional configuration is required for basic usage. Simply install the plugin and it will display a random message on startup or when the command is invoked.

### 🪴 Usage

- On startup, a random message will be displayed after a brief delay.
- You can manually trigger a random message by executing `:Mentor` in command mode.
- If defaults.enabled is set to true, the plugin will include default tips along with your custom tips.
- You can exclude specific default tips using the defaults.skip_list array.
- If defaults.enabled is false, only your custom tips defined in the setup function will be displayed.

### Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.

## 📝 License

This project is licensed under the MIT License.
