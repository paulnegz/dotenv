-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    { 'tzachar/cmp-ai', dependencies = 'nvim-lua/plenary.nvim' },
    config = function()
      require('cmp').setup {
        sources = { { name = 'cmp_ai' } },
        --[[ 
        formatting = {
          format = require('lspkind').cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            symbol_map = {
              HF = '',
              OpenAI = '',
              Codestral = '',
              Bard = '',
            },
          },
        },
]]
        --
      }

      local compare = require 'cmp.config.compare'
      require('cmp').setup {
        sorting = {
          priority_weight = 2,
          comparators = {
            require 'cmp_ai.compare',
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
      }

      local cmp_ai = require 'cmp_ai.config'
      cmp_ai:setup {
        max_lines = 100,
        provider = 'Ollama',
        provider_options = {
          model = 'codellama',
          auto_unload = false, -- Set to true to automatically unload the model when
          -- exiting nvim.
          prompt = function(lines_before, lines_after)
            return lines_before
          end,
          suffix = function(lines_after)
            return lines_after
          end,
          raw_response_cb = function(response)
            -- the `response` parameter contains the raw response (JSON-like) object.
            vim.notify(vim.inspect(response)) -- show the response as a lua table
            vim.g.ai_raw_response = response -- store the raw response in a global
            -- variable so that you can use it
            -- somewhere else (like statusline).
          end,
        },
        notify = true,
        notify_callback = function(msg)
          vim.notify(msg)
        end,

        run_on_every_keystroke = true,
        ignored_file_types = {
          -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
      }
    end,

    { 'hrsh7th/nvim-cmp', dependencies = { 'tzachar/cmp-ai' } },
  },
}
