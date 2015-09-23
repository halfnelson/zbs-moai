

return {
  name = "Moai Extensions",
  description = "Set of helpers for MOAI development",
  author = "David Pershouse",
  version = 0.1,
  dependencies = 0.51,


  onMenuFiletree = function(self, menu, tree, event)
    local item_id = event:GetItem()
    local name = tree:GetItemFullName(item_id)
    
    if (tree:IsDirectory(item_id) ) then
      local id = ID(self.fname .. ".openimage")
      menu:AppendSeparator()
      menu:Append(id, ("Open Image (%d x %d)"):format(width, height))
      tree:Connect(id, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() fileShow(name) end)
    end
  end,
}