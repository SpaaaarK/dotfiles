-- Function to parse Taskfile and extract task names
local function get_taskfile_tasks()
  local taskfile = vim.fn.findfile("Taskfile.yml", vim.fn.getcwd() .. ";") -- Look for Taskfile.yml
  if taskfile == "" then
    taskfile = vim.fn.findfile("Taskfile.yaml", vim.fn.getcwd() .. ";") -- Fallback to Taskfile.yaml
  end
  if taskfile == "" then
    return {} -- No Taskfile found
  end

  local tasks = {}
  -- Read the Taskfile
  local lines = vim.fn.readfile(taskfile)
  for _, line in ipairs(lines) do
    -- Match lines like "task_name:" (simplified YAML task detection)
    local task = line:match("^%s*([%w_-]+):%s*$")
    if task then
      table.insert(tasks, task)
    end
  end
  return tasks
end

-- Create custom command to run tasks with autocompletion
vim.api.nvim_create_user_command(
  'RunTask',
  function(opts)
    local task = opts.args
    if task == "" then
      print("Error: No task specified")
      return
    end
    -- Execute the task using the 'task' command
    vim.fn.system("task " .. vim.fn.shellescape(task))
    -- Optionally, print the output or handle errors
    if vim.v.shell_error == 0 then
      print("Task '" .. task .. "' executed successfully")
    else
      print("Error running task '" .. task .. "': " .. vim.fn.system("task " .. vim.fn.shellescape(task)))
    end
  end,
  {
    nargs = 1, -- Expect one argument (the task name)
    complete = function()
      -- Provide task names for autocompletion
      return get_taskfile_tasks()
    end,
  }
)
