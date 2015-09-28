
local ProjectManager = require("zbs-moai.texture-packer.texturepackerproject")
package.path =  package.path .. ';zbs-moai/texture-packer/?.lua'
local textureMapperMenuId = ID("zbs-moai.texturemappermenu")
local textureMapperRemoveMenuId = ID("zbs-moai.texturemappermenuremove")
local texturePackerConfigId = ID("zbs-moai.textureMapperConfig")

local TEXTUREATLAS, TEXTUREATLASCONF


local project


local function onProjectPreLoad(self, projdir) 
   project = ProjectManager.loadProject(projdir)
end
    



local function onFiletreeGetIcon(name, isdir)
  if isdir and project:isTextureAtlasFolder(name) then
    return TEXTUREATLAS
  end
  
  if not isdir then
    if wx.wxFileName(name):GetFullName() == "pack.json" or
      wx.wxFileName(name):GetFullName() == "texturepacker-config.lua" then
        return TEXTUREATLASCONF
    end
  end
  
  return false
end



local function onMenuFiletree(self, menu, tree, event)
  local item_id = event:GetItem()
    local name = tree:GetItemFullName(item_id)
    menu:AppendSeparator()
    if (tree:IsDirectory(item_id)) then
     name = name..GetPathSeparator()
     if not project:isTextureAtlasFolder(name) then
      menu:Append(textureMapperMenuId, "Create Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
            if project:newAtlasAt(name) then
              tree:SetItemImage(item_id,TEXTUREATLAS)
              tree:RefreshChildren()
            end
        end)
    else
      menu:Append(textureMapperMenuId, "Configure Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
          project:launchConfigEditor(name)
        end)
      
      menu:Append(textureMapperRemoveMenuId, "Remove Texture Atlas")
      menu:Enable(textureMapperRemoveMenuId, true)

      tree:Connect(textureMapperRemoveMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
          project:removeAtlasAt(name)
          tree:SetItemImage(item_id,0)
          tree:RefreshChildren()
        end)
    end
  end
end

local function showConfig()
  project:launchProjectEditor()
  --DisplayOutputLn("Show config now")
end


local function onRegister () 
   local ico = wx.wxBitmap("zbs-moai/res/TEXTUREATLAS.png")
   TEXTUREATLAS = ide.filetree.imglist:Add(ico)
   
   ico = wx.wxBitmap("zbs-moai/res/TEXTUREATLASCONF.png")
   TEXTUREATLASCONF = ide.filetree.imglist:Add(ico)
   
   local oldcallback = ide.filetree.settings.iconCallback
   ide.filetree.settings.iconCallback = function(name,isdir)
      return onFiletreeGetIcon(name,isdir) or oldcallback(name,isdir)
   end
   
   --add our config menu to project tab
   --get project menu
   local projectMenuId = ide.frame.menuBar:FindMenu(TR("&Project"))
   local projectMenu = ide.frame.menuBar:GetMenu(projectMenuId)
   
   --append
   projectMenu:Append(texturePackerConfigId, TR("Configure Texure Packer..."), TR("Launch Texture Packer Configuration"))
   projectMenu:Connect(texturePackerConfigId, wx.wxEVT_COMMAND_MENU_SELECTED, showConfig)
end

return {
  name = "Texture Packer Support",
  description = "Integrates libgdx TexturePacker with ZBS",
  author = "David Pershouse",
  version = 0.1,
  dependencies = 0.51,
  onRegister = onRegister,
  onMenuFiletree = onMenuFiletree,
  onProjectPreLoad = onProjectPreLoad

  
}