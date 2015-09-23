--[[--
  Use this file to specify System preferences.
  Review [examples](+C:\Users\streamer\Downloads\ZeroBraneStudio\cfg\user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--

 
 local G = ...
 styles = G.loadfile('cfg/tomorrow.lua')('Monokai')
 stylesoutshell = styles
 
 editor.fontname = "consolas"
 outputshell.fontname = "consolas"
 
 moai = { entrypoints = { "main.lua" } }
 path.moai = 'K:/dev/mobile/moaiforge/sdks/moaiforge/util/moai.exe'