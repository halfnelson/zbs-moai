--[[ note to self, to dump table to string for config
local md = require("lualibs.mobdebug.mobdebug")
local function tableToLua(t, varname)
  md.line(t , {indent='  ', comment=false, name =varname} )
end

todo, use imagelist:Add(bmp) to add to ide.filetree.imglist, use 16x16 and create bitmap using wx.wxBitmap(file) on plugin startup
add getIcon hook for plugins to filetree.lua



]]

local md = require("lualibs.mobdebug.mobdebug")
local function tableToLua(t)
  return md.line(t , {indent='  ', comment=false} )
end


local TEXTUREATLAS, TEXTUREATLASCONF

local function newTextureAtlas(name)
  return {
     Folder=name
  }
end

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

local TextureAtlasDirs = {}

function discoverTextureAtlasDirs(dir)
  --FileSysGetRecursive(dir,true,"pack.json")
  for _, file in ipairs(FileSysGetRecursive(dir,true,"pack.json")) do
    local name = GetPathWithSep(file)
    TextureAtlasDirs[GetPathWithSep(name)] = newTextureAtlas(name)
  end
end



function onProjectLoad(self, projdir) 
  --find texture atlas dirs
  discoverTextureAtlasDirs(projdir)
  print("on project load", projdir)
end

    
function onRegister () 
  print("on register")
   local ico = wx.wxBitmap("zbs-moai/res/TEXTUREATLAS.png")
   TEXTUREATLAS = ide.filetree.imglist:Add(ico)
   
   ico = wx.wxBitmap("zbs-moai/res/TEXTUREATLASCONF.png")
   TEXTUREATLASCONF = ide.filetree.imglist:Add(ico)
   
   
   local oldcallback = ide.filetree.settings.iconCallback
   ide.filetree.settings.iconCallback = function(name,isdir)
      return onFiletreeGetIcon(name,isdir) or oldcallback(name,isdir)
   end
end

function isSameOrSubpathOf(root,name)
  return root == name or  string.sub(name,1,string.len(root))==root
end

function isTextureAtlasFolder(name)
   for r,_ in pairs(TextureAtlasDirs) do
       if isSameOrSubpathOf(r,name) then
         return true
       end
    end
    
    return false
end


function onFiletreeGetIcon(name, isdir)
  DisplayOutputLn("icon for ",name)
  if isdir and isTextureAtlasFolder(name) then
    return TEXTUREATLAS
  end
  
  if not isdir and wx.wxFileName(name):GetFullName() == "pack.json" then
    return TEXTUREATLASCONF
  end
  
  return false
end


local textureMapperMenuId = ID("zbs-moai.texturemappermenu")
function onMenuFiletree(self, menu, tree, event)
  local item_id = event:GetItem()
    local name = tree:GetItemFullName(item_id)
    
    if (tree:IsDirectory(item_id) and not TextureAtlasDirs[name]) then
      menu:Append(textureMapperMenuId, "Create Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
            DisplayOutputLn("Selected "..name) 
            TextureAtlasDirs[name] = newTextureAtlas(name)
            tree:SetItemImage(item_id,TEXTUREATLAS)
        end)
    else
      menu:Append(textureMapperMenuId, "Configure Texture Atlas")
      menu:Enable(textureMapperMenuId, true)

      tree:Connect(textureMapperMenuId, wx.wxEVT_COMMAND_MENU_SELECTED,
        function() 
          DisplayOutputLn("Selected "..name) 
          if not TextureAtlasDirs[name] then
            TextureAtlasDirs[name] = newTextureAtlas(name)
            tree:SetItemImage(item_id,TEXTUREATLAS)
          else
            TextureAtlasDirs[name] = nil
            tree:SetItemImage(item_id, 0)
          end
          
        end)
    end
    DisplayOutputLn(self:GetFileName(), "onMenuFiletree")
end


return {
  name = "Moai Extensions",
  description = "Set of helpers for MOAI development",
  author = "David Pershouse",
  version = 0.1,
  dependencies = 0.51,
  onRegister = onRegister,
  onMenuFiletree = onMenuFiletree,
  onProjectPreLoad = onProjectLoad

  
}