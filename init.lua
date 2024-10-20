local debug_module = require("gabe.utils.debug")

-- Create a global debug function
_G.D = function(message)
  if debug_module.DEBUG then
    debug_module.log(message)
  end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
