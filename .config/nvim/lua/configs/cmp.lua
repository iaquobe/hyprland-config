local cmp = require("cmp")

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm only explicitly selected items
    },
    completion = {
        autocomplete = false, -- Disable automatic completion popup
    },
})
