-- Lazy.nvim plugin specification
return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local harpoon = require("harpoon")
            -- REQUIRED: Initialize Harpoon
            harpoon:setup()

            -- Basic Telescope configuration for Harpoon
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end
                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            -- Keymaps
            -- Add file to Harpoon list
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })

            -- Remove file from Harpoon list
            vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end, { desc = "Harpoon: Remove file" })
            -- Open Telescope Harpoon menu
            vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon: Open Telescope menu" })

            vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
            vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
            vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
            vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
            vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Harpoon: Go to file 5" })
            vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end, { desc = "Harpoon: Go to file 6" })
            vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end, { desc = "Harpoon: Go to file 7" })
            vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end, { desc = "Harpoon: Go to file 8" })

        end,
    },
}
