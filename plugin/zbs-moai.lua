--[[ note to self, to dump table to string for config
local md = require("lualibs.mobdebug.mobdebug")
local function tableToLua(t, varname)
  md.line(t , {indent='  ', comment=false, name =varname} )
end

todo, use imagelist:Add(bmp) to add to ide.filetree.imglist, use 16x16 and create bitmap using wx.wxBitmap(file) on plugin startup
add getIcon hook for plugins to filetree.lua



]]

return {
  name = "Moai Extensions",
  description = "Set of helpers for MOAI development",
  author = "David Pershouse",
  version = 0.1,
  dependencies = 0.51,


  
}