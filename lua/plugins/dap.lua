return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm install --legacy-peer-deps && npm run build",
    },
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")

    require("mason-nvim-dap").setup({
      automatic_setup = true,
      ensure_installed = {
        "delve",
        "debugpy",
        "codelldb",
        "js-debug-adapter",
      },
    })

    require("dap-go").setup({
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = {},
        detached = vim.fn.has("win32") == 0,
        cwd = nil,
      },
      tests = {
        verbose = false,
      },
    })

    require("dap-python").setup("python")
    require("nvim-dap-virtual-text").setup()

    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = {
        "pwa-node",
        "pwa-chrome",
        "pwa-msedge",
        "node-terminal",
        "pwa-extensionHost",
      },
    })

    dap.adapters.nlua = function(callback, config)
      callback({
        type = "server",
        host = config.host or "127.0.0.1",
        port = config.port or 8086,
      })
    end

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim",
        host = function()
          local value = vim.fn.input("Host [127.0.0.1]: ")
          if value == nil or value == "" then
            return "127.0.0.1"
          end
          return value
        end,
        port = function()
          local value = vim.fn.input("Port: ", "8086")
          return tonumber(value)
        end,
      },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local exe = vim.fn.exepath("python3")
          if exe == nil or exe == "" then
            return "python"
          end
          return exe
        end,
      },
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        outFiles = { "${workspaceFolder}/**/*.js" },
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}
