--[[ note to self, to dump table to string for config
local md = require("lualibs.mobdebug.mobdebug")
local function tableToLua(t, varname)
  md.line(t , {indent='  ', comment=false, name =varname} )
end

todo, use imagelist:Add(bmp) to add to ide.filetree.imglist, use 16x16 and create bitmap using wx.wxBitmap(file) on plugin startup
add getIcon hook for plugins to filetree.lua



]]
--

local textureMapperMenuId = ID("zbs-moai.texturemappermenu")
local textureMapperRemoveMenuId = ID("zbs-moai.texturemappermenuremove")
local texturePackerConfigId = ID("zbs-moai.textureMapperConfig")

local md = require("lualibs.mobdebug.mobdebug")
local function tableToLua(t)
  return md.line(t , {indent='  ', comment=false} )
end


local TEXTUREATLAS, TEXTUREATLASCONF



--converts a lua table string into a gdx compat minimal json string
local function dodgyLuaToJson(l)
  local j = string.gsub(l,"=",":") --string.gsub(l,"
  j = string.gsub(j,": {(.-)}",": [%1]")
  return j
end



local function dodgyTableToJson(t) 
  return dodgyLuaToJson(tableToLua(t))
end

local function dodgyJsonToLua(j)
  local l = string.gsub(j,":","=")
  l = string.gsub(l,"= %[(.-)%]","= { %1 }") --swap array syntax
  l = string.gsub(l,"\"(%w-)\" =","%1 =") --strip json quotes
  l = string.gsub(l,"(%w-) =","['%1'] =") --table key syntax for lua
  return l
end

local function dodgyLuaToTable(l)
    local fn,err = loadstring("do local _ = "..l.."; return _ end")
    return fn()
end

local function dodgyJsonToTable(j)
  return dodgyLuaToTable(dodgyJsonToLua(j))
end

local function tableToConfigLua(t, varname)
  return md.line(t , {indent='  ', comment=false, name =varname} )
end

local TextureAtlasDirs = {}
local JavaBin = "java"

local newPackJSON = {

}
  

local PackJSONDefaults = {
    pot= true,
    paddingX= 2,
    paddingY= 2,
    bleed= true,
    edgePadding= true,
    duplicatePadding= false,
    rotation= false,
    minWidth= 16,
    minHeight= 16,
    maxWidth= 1024,
    maxHeight= 1024,
    square= false,
    stripWhitespaceX= false,
    stripWhitespaceY= false,
    alphaThreshold= 0,
    filterMin= "Nearest",
    filterMag= "Nearest",
    wrapX= "ClampToEdge",
    wrapY= "ClampToEdge",
    ['format']= "RGBA8888",
    alias= true,
    outputFormat= "png",
    jpegQuality= 0.9,
    ignoreBlankImages= true,
    fast= false,
    debug= false,
    combineSubdirectories= false,
    flattenPaths= false,
    premultiplyAlpha= false,
    useIndexes= true,
    limitMemory= true,
    grid= false,
    scale= { 1 },
    scaleSuffix= { "" }
}

local function makeRelative(name)
  local dir = wx.wxFileName.DirName(name)
  dir:MakeRelativeTo(ide.filetree.projdir)
  return dir:GetFullPath(wx.wxPATH_UNIX)
end




local function loadConfig(dir)
  local f = wx.wxFileName.DirName(dir)
  f:SetFullName("zbs-texturepacker-config.lua")
  if f:FileExists() then
      local cfgfn = loadfile(f:GetFullPath())
      if cfgfn then
        local config = cfgfn()
        if config then
          TextureAtlasDirs = config.AtlasDirs or {}
          JavaBin = config.JavaBin or "java"
          return
        end
      end
  end
  TextureAtlasDirs = {}
  JavaBin = "java"
end

local function saveConfig()
  local f = wx.wxFileName.DirName(ide.filetree.projdir)
  f:SetFullName("zbs-texturepacker-config.lua")
  local config = { JavaBin= JavaBin, AtlasDirs= TextureAtlasDirs }
  FileWrite(f:GetFullPath(), tableToConfigLua(config, "textureAtlasDirs"))
end

local function isSameOrSubpathOf(root,name)
  return root == name or  string.sub(name,1,string.len(root))==root
end

local function rootTextureAtlasFolderFor(name)
  for r,_ in pairs(TextureAtlasDirs) do
       local fullpath = ide.filetree.projdir..GetPathSeparator()..(r:gsub("/",GetPathSeparator()))
       if isSameOrSubpathOf(fullpath,name) then
         return r
       end
  end
  return false
end

local function isTextureAtlasFolder(name)
  return rootTextureAtlasFolderFor(name) and true or false
end

local getCombinedConfig, getParentConfig

local function savePackerConfig(dir, config)
   --first work out what fields have changed from default
   local diff = {}
   local parentConfig = getParentConfig(dir)
   local empty = true
   for k,v in pairs(config) do
    if not parentConfig[k] == v then
      diff[k] = v
      empty = false
    end
   end
   
   if not empty then
     local content = dodgyTableToJson(diff)
     FileWrite(dir..GetPathSeparator().."pack.json", content)
   else
     --we can remove it
     wx.wxRemoveFile(dir..GetPathSeparator().."pack.json")
   end
end

local function overrideConfig(base, ext)
  local newSettings = {}
  for k,v in pairs(base) do
    newSettings[k]=v
  end
  
  for k,v in pairs(ext) do
    newSettings[k]=v
  end
  return newSettings
end

local function configAtPath(dir)
  
  local f = wx.wxFileName.DirName(dir)
  f:SetFullName("pack.json")
  if f:FileExists() then
    return dodgyJsonToTable(FileRead(f:GetFullPath()))
  else
    return newPackJSON
  end
end
  

local function getParentFolder(dir)
    local f = wx.wxFileName.DirName(dir)
    f:RemoveLastDir()
    return f:GetFullPath()
end



function getParentConfig(dir)
  local parentDir = getParentFolder(dir)
  local parentConfig
  if isTextureAtlasFolder(parentDir) then
    parentConfig = getCombinedConfig(parentDir)
  else
    parentConfig = PackJSONDefaults
  end
  return parentConfig
end


function getCombinedConfig(dir)
  local parentConfig = getParentConfig(dir)
  local thisConfig = configAtPath(dir)
  return overrideConfig(parentConfig, thisConfig)
end






--[[
local function discoverTextureAtlasDirs(dir)
  for _, file in ipairs(FileSysGetRecursive(dir,true,"pack.json")) do
    local name = GetPathWithSep(file)
    TextureAtlasDirs[GetPathWithSep(name)] = newTextureAtlas(name)
  end
end]]--



local function onProjectPreLoad(self, projdir) 
  loadConfig(projdir)
end
    

local function launchConfigEditor(name)
  DisplayOutputLn("launchEditorFor",name)
  local textureAtlasFolder = rootTextureAtlasFolderFor(name) or name
  DisplayOutputLn(textureAtlasFolder)
  local settingsDialog = require("zbs-moai.texture-packer.texturepackerdialog")(TextureAtlasDirs[textureAtlasFolder] or {}, getCombinedConfig(name))
  local result = settingsDialog.TexturePackerSettings:ShowModal()
  if result == 0 then
    local outputSettings = settingsDialog.GetOutputSettings()
    DisplayOutputLn("Got Settings", tableToLua(outputSettings))
    --normalise output path
    TextureAtlasDirs[textureAtlasFolder] = outputSettings
    saveConfig()
    local packerSettings = settingsDialog.GetPackerSettings()
    DisplayOutputLn("Got Packer Settings", tableToLua(packerSettings))
    savePackerConfig(name, packerSettings)
  end
  settingsDialog.TexturePackerSettings:Destroy()
  DisplayOutputLn("result",result)
  return result == 0
end

local function newTextureAtlas(name)
  --normalize name and make relative
  name = makeRelative(name)
  return launchConfigEditor(name)
end

local function onFiletreeGetIcon(name, isdir)
  if isdir and isTextureAtlasFolder(name) then
    return TEXTUREATLAS
  end
  
  if not isdir then
    if wx.wxFileName(name):GetFullName() == "pack.json" or
      wx.wxFileName(name):GetFullName() == "zbs-texturepacker-config.lua" then
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
     if not isTextureAtlasFolder(name) then
      menu:Append(textureMapperMenuId, "Create Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
            if newTextureAtlas(name) then
              tree:SetItemImage(item_id,TEXTUREATLAS)
              tree:RefreshChildren()
            end
        end)
    else
      menu:Append(textureMapperMenuId, "Configure Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
          launchConfigEditor(name)
        end)
      
      menu:Append(textureMapperRemoveMenuId, "Remove Texture Atlas")
      menu:Enable(textureMapperRemoveMenuId, true)

      tree:Connect(textureMapperRemoveMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
          local r = rootTextureAtlasFolderFor(name)
          TextureAtlasDirs[r] = nil
          tree:SetItemImage(item_id,0)
          tree:RefreshChildren()
          saveConfig()
        end)
    end
  end
end

local function showConfig()
  DisplayOutputLn("Show config now")
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