# matrix-cold.nvim

A pure, monochrome colorscheme focused on neon green for Neovim, built to simulate the aesthetics of Matrix phosphor terminals. The palette is strictly defined between absolute black and pure white, with distinct grays added for better contrast on comments and numbers, eliminating visual fatigue caused by blue or red spectrums.

## Features

* Strict color scale (Absolute Black -> Dark Green -> Neon Green -> White), with gray accents for code readability.
* Global toggle to disable italics.
* Native `Treesitter` support.
* Built-in `Telescope` integration.
* Optimized for Neovim >= 0.8.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "thorin64/matrix-cold.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Optional: Disable italics before loading the colorscheme
    vim.g.matrix_italic = false 

    vim.cmd("colorscheme matrix-cold")
  end,
}
