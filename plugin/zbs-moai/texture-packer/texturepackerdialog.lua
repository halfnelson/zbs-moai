----------------------------------------------------------------------------
-- Lua code generated with wxFormBuilder (version Jun 17 2015)
-- http://www.wxformbuilder.org/
----------------------------------------------------------------------------

-- Load the wxLua module, does nothing if running from wxLua, wxLuaFreeze, or wxLuaEdit

local function createSettingsDialog(outputSettings, packerSettings)
local UI = {}


-- create TexturePackerSettings
UI.TexturePackerSettings = wx.wxDialog (wx.NULL, wx.wxID_ANY, "Texture Packer Settings", wx.wxDefaultPosition, wx.wxSize( 668,583 ), wx.wxDEFAULT_DIALOG_STYLE )
	UI.TexturePackerSettings:SetSizeHints( wx.wxDefaultSize, wx.wxDefaultSize )
	
	UI.bDialogSections = wx.wxBoxSizer( wx.wxVERTICAL )
	
	UI.m_panel1 = wx.wxPanel( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSUNKEN_BORDER + wx.wxTAB_TRAVERSAL )
	UI.m_panel1:SetBackgroundColour( wx.wxColour( 176, 176, 176 ) )
	
	UI.bSizer76 = wx.wxBoxSizer( wx.wxVERTICAL )
	
	UI.bSizer73 = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText62 = wx.wxStaticText( UI.m_panel1, wx.wxID_ANY, "Output Folder", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText62:Wrap( -1 )
	UI.m_staticText62:SetFont( wx.wxFont( wx.wxNORMAL_FONT:GetPointSize(), 70, 90, 92, False, "" ) )
	UI.m_staticText62:SetForegroundColour( wx.wxColour( 255, 255, 255 ) )
	UI.m_staticText62:SetMinSize( wx.wxSize( 96,-1 ) )
	
	UI.bSizer73:Add( UI.m_staticText62, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_outputDir = wx.wxDirPickerCtrl( UI.m_panel1, wx.wxID_ANY, "" , "Select a folder", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxDIRP_DEFAULT_STYLE  )
	UI.m_outputDir:SetBackgroundColour( wx.wxColour( 176, 176, 176 ) )
	
	UI.bSizer73:Add( UI.m_outputDir, 1, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	
	UI.bSizer76:Add( UI.bSizer73, 1, wx.wxEXPAND, 5 )
	
	UI.bSizer74 = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText63 = wx.wxStaticText( UI.m_panel1, wx.wxID_ANY, "Pack Name", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText63:Wrap( -1 )
	UI.m_staticText63:SetFont( wx.wxFont( wx.wxNORMAL_FONT:GetPointSize(), 70, 90, 92, False, "" ) )
	UI.m_staticText63:SetForegroundColour( wx.wxColour( 255, 255, 255 ) )
	UI.m_staticText63:SetMinSize( wx.wxSize( 96,-1 ) )
	
	UI.bSizer74:Add( UI.m_staticText63, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_packName = wx.wxTextCtrl( UI.m_panel1, wx.wxID_ANY, "pack", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_packName:SetMinSize( wx.wxSize( 170,-1 ) )
	
	UI.bSizer74:Add( UI.m_packName, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	
	UI.bSizer76:Add( UI.bSizer74, 1, wx.wxEXPAND, 5 )
	
	
	UI.m_panel1:SetSizer( UI.bSizer76 )
	UI.m_panel1:Layout()
	UI.bSizer76:Fit( UI.m_panel1 )
	UI.bDialogSections:Add( UI.m_panel1, 0, wx.wxEXPAND  + wx. wxALL, 2 )
	
	UI.bPackerSettings = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.bCol1 = wx.wxBoxSizer( wx.wxVERTICAL )
	
	UI.m_staticText11 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Output Format", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText11:Wrap( -1 )
	UI.m_staticText11:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol1:Add( UI.m_staticText11, 0, wx.wxALL, 5 )
	
	UI.bImgFormat = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Image Format", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2:Wrap( -1 )
	UI.m_staticText2:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bImgFormat:Add( UI.m_staticText2, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_imageFormatChoices = { "png", "jpg" }
	UI.m_imageFormat = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_imageFormatChoices, 0 )
	UI.m_imageFormat:SetStringSelection("png")
  
	UI.bImgFormat:Add( UI.m_imageFormat, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bImgFormat, 0, wx.wxEXPAND, 5 )
	
	UI.bJpegQuality = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211112 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Jpeg Quality (%)", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211112:Wrap( -1 )
	UI.m_staticText211112:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bJpegQuality:Add( UI.m_staticText211112, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_jpegQuality = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 10, 100, 90 )
	UI.bJpegQuality:Add( UI.m_jpegQuality, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bJpegQuality, 0, wx.wxEXPAND, 5 )
	
	UI.bPremultiplyAlpha = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111111:Wrap( -1 )
	UI.m_staticText2111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bPremultiplyAlpha:Add( UI.m_staticText2111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_premultiplyAlpha = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Premultiply Alpha", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bPremultiplyAlpha:Add( UI.m_premultiplyAlpha, 0, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bPremultiplyAlpha, 0, wx.wxEXPAND, 5 )
	
	UI.m_staticText1 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Texture", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText1:Wrap( -1 )
	UI.m_staticText1:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol1:Add( UI.m_staticText1, 0, wx.wxALL, 5 )
	
	UI.bPixelFormat = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Pixel Format", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21:Wrap( -1 )
	UI.m_staticText21:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bPixelFormat:Add( UI.m_staticText21, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_pixelFormatChoices = { "RBGA8888", "RGBA4444", "RGB888", "RGB565" }
	UI.m_pixelFormat = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_pixelFormatChoices, 0 )
	UI.m_pixelFormat:SetSelection( 0 )
	UI.bPixelFormat:Add( UI.m_pixelFormat, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bPixelFormat, 0, wx.wxEXPAND, 5 )
	
	UI.bMinFilter = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Min Filter", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211:Wrap( -1 )
	UI.m_staticText211:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMinFilter:Add( UI.m_staticText211, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_minFilterChoices = { "Nearest", "Linear" }
	UI.m_minFilter = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_minFilterChoices, 0 )
	UI.m_minFilter:SetSelection( 0 )
	UI.bMinFilter:Add( UI.m_minFilter, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bMinFilter, 0, wx.wxEXPAND, 5 )
	
	UI.bMagFilter = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Mag Filter", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111:Wrap( -1 )
	UI.m_staticText2111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMagFilter:Add( UI.m_staticText2111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_magFilterChoices = { "Nearest", "Linear" }
	UI.m_magFilter = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_magFilterChoices, 0 )
	UI.m_magFilter:SetSelection( 0 )
	UI.bMagFilter:Add( UI.m_magFilter, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bMagFilter, 0, wx.wxEXPAND, 5 )
	
	UI.bWrapx = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "WrapX", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111:Wrap( -1 )
	UI.m_staticText21111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bWrapx:Add( UI.m_staticText21111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_wrapXChoices = { "ClampToEdge", "Repeat" }
	UI.m_wrapX = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_wrapXChoices, 0 )
	UI.m_wrapX:SetSelection( 0 )
	UI.bWrapx:Add( UI.m_wrapX, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bWrapx, 0, wx.wxEXPAND, 5 )
	
	UI.bWrapy = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "WrapY", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211111:Wrap( -1 )
	UI.m_staticText211111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bWrapy:Add( UI.m_staticText211111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_wrapYChoices = { "ClampToEdge", "Repeat" }
	UI.m_wrapY = wx.wxChoice( UI.TexturePackerSettings, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize, UI.m_wrapYChoices, 0 )
	UI.m_wrapY:SetSelection( 0 )
	UI.bWrapy:Add( UI.m_wrapY, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bWrapy, 0, wx.wxEXPAND, 5 )
	
	UI.m_staticText12 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Whitespace Stripping", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText12:Wrap( -1 )
	UI.m_staticText12:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol1:Add( UI.m_staticText12, 0, wx.wxALL, 5 )
	
	UI.bStripX = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111111112 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111111112:Wrap( -1 )
	UI.m_staticText21111111112:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bStripX:Add( UI.m_staticText21111111112, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_stripWhitespaceX = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Strip X Whitespace", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bStripX:Add( UI.m_stripWhitespaceX, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bStripX, 0, wx.wxEXPAND, 5 )
	
	UI.bStripY = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211111111121 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211111111121:Wrap( -1 )
	UI.m_staticText211111111121:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bStripY:Add( UI.m_staticText211111111121, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_stripWhitespaceY = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Strip Y Whitespace", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bStripY:Add( UI.m_stripWhitespaceY, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bStripY, 0, wx.wxEXPAND, 5 )
	
	UI.bAlphaThreshold = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111213 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Alpha Threshold", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111213:Wrap( -1 )
	UI.m_staticText21111213:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bAlphaThreshold:Add( UI.m_staticText21111213, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_alphaThreshold = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 0, 255, 0 )
	UI.bAlphaThreshold:Add( UI.m_alphaThreshold, 1, wx.wxALL, 5 )
	
	
	UI.bCol1:Add( UI.bAlphaThreshold, 0, wx.wxEXPAND, 5 )
	
	
	UI.bPackerSettings:Add( UI.bCol1, 1, wx.wxEXPAND, 5 )
	
	UI.bCol2 = wx.wxBoxSizer( wx.wxVERTICAL )
	
	UI.m_staticText111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Page Size", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText111:Wrap( -1 )
	UI.m_staticText111:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol2:Add( UI.m_staticText111, 0, wx.wxALL + wx.wxEXPAND, 5 )
	
	UI.bMinPageWidth = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111121 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Min Width", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111121:Wrap( -1 )
	UI.m_staticText2111121:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMinPageWidth:Add( UI.m_staticText2111121, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_minPageWidth = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 16, 2048, 16 )
	UI.bMinPageWidth:Add( UI.m_minPageWidth, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bMinPageWidth, 0, wx.wxEXPAND, 5 )
	
	UI.bMinPageWidth1 = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111211 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Min Height", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111211:Wrap( -1 )
	UI.m_staticText21111211:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMinPageWidth1:Add( UI.m_staticText21111211, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_minPageHeight = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 16, 2048, 16 )
	UI.bMinPageWidth1:Add( UI.m_minPageHeight, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bMinPageWidth1, 0, wx.wxEXPAND, 5 )
	
	UI.bMaxPageWidth = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111212 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Max Width", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111212:Wrap( -1 )
	UI.m_staticText21111212:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMaxPageWidth:Add( UI.m_staticText21111212, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_maxPageWidth = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 16, 2048, 1024 )
	UI.bMaxPageWidth:Add( UI.m_maxPageWidth, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bMaxPageWidth, 0, wx.wxEXPAND, 5 )
	
	UI.bMaxPageHeight = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211112121 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Max Height", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211112121:Wrap( -1 )
	UI.m_staticText211112121:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bMaxPageHeight:Add( UI.m_staticText211112121, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_maxPageHeight = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 16, 2048, 1024 )
	UI.bMaxPageHeight:Add( UI.m_maxPageHeight, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bMaxPageHeight, 0, wx.wxEXPAND, 5 )
	
	UI.bForceSquare = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111111:Wrap( -1 )
	UI.m_staticText21111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bForceSquare:Add( UI.m_staticText21111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_forceSquare = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Force Square", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bForceSquare:Add( UI.m_forceSquare, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bForceSquare, 0, wx.wxEXPAND, 5 )
	
	UI.bForcePOT = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211111111:Wrap( -1 )
	UI.m_staticText211111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bForcePOT:Add( UI.m_staticText211111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_pot = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Power of 2", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bForcePOT:Add( UI.m_pot, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bForcePOT, 0, wx.wxEXPAND, 5 )
	
	UI.m_staticText1111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Padding", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText1111:Wrap( -1 )
	UI.m_staticText1111:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol2:Add( UI.m_staticText1111, 0, wx.wxALL, 5 )
	
	UI.bPaddingX = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211112122 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Padding X", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211112122:Wrap( -1 )
	UI.m_staticText211112122:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bPaddingX:Add( UI.m_staticText211112122, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_paddingX = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 0, 1024, 2 )
	UI.bPaddingX:Add( UI.m_paddingX, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bPaddingX, 0, wx.wxEXPAND, 5 )
	
	UI.bPaddingY = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111121221 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Padding Y", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111121221:Wrap( -1 )
	UI.m_staticText2111121221:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bPaddingY:Add( UI.m_staticText2111121221, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_paddingY = wx.wxSpinCtrl( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxSP_ARROW_KEYS, 0, 1024, 2 )
	UI.bPaddingY:Add( UI.m_paddingY, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bPaddingY, 0, wx.wxEXPAND, 5 )
	
	UI.bEdgePadding = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111111111:Wrap( -1 )
	UI.m_staticText2111111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bEdgePadding:Add( UI.m_staticText2111111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_edgePadding = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Pad From Edges", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bEdgePadding:Add( UI.m_edgePadding, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bEdgePadding, 0, wx.wxEXPAND, 5 )
	
	UI.bDuplicatePadding = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText21111111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText21111111111:Wrap( -1 )
	UI.m_staticText21111111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bDuplicatePadding:Add( UI.m_staticText21111111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_duplicatePadding = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Bleed into Padding", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bDuplicatePadding:Add( UI.m_duplicatePadding, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bDuplicatePadding, 0, wx.wxEXPAND, 5 )
	
	UI.bGrid = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText211111111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText211111111111:Wrap( -1 )
	UI.m_staticText211111111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bGrid:Add( UI.m_staticText211111111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_grid = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Force Uniform Grid", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bGrid:Add( UI.m_grid, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bGrid, 0, wx.wxEXPAND, 5 )
	
	UI.m_staticText11111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "Debug", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.m_staticText11111:Wrap( -1 )
	UI.m_staticText11111:SetFont( wx.wxFont( 10, 70, 90, 92, False, "" ) )
	
	UI.bCol2:Add( UI.m_staticText11111, 0, wx.wxALL, 5 )
	
	UI.bDebug = wx.wxBoxSizer( wx.wxHORIZONTAL )
	
	UI.m_staticText2111111111111 = wx.wxStaticText( UI.TexturePackerSettings, wx.wxID_ANY, "", wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxALIGN_RIGHT )
	UI.m_staticText2111111111111:Wrap( -1 )
	UI.m_staticText2111111111111:SetFont( wx.wxFont( wx.wxNORMAL_FONT:GetPointSize(), 70, 90, 90, False, "" ) )
	UI.m_staticText2111111111111:SetMinSize( wx.wxSize( 100,-1 ) )
	
	UI.bDebug:Add( UI.m_staticText2111111111111, 0, wx.wxALL + wx.wxALIGN_CENTER_VERTICAL, 5 )
	
	UI.m_debug = wx.wxCheckBox( UI.TexturePackerSettings, wx.wxID_ANY, "Draw Debug Lines", wx.wxDefaultPosition, wx.wxDefaultSize, 0 )
	UI.bDebug:Add( UI.m_debug, 1, wx.wxALL, 5 )
	
	
	UI.bCol2:Add( UI.bDebug, 0, wx.wxEXPAND, 5 )
	
	
	UI.bPackerSettings:Add( UI.bCol2, 1, wx.wxEXPAND, 5 )
	
	
	UI.bDialogSections:Add( UI.bPackerSettings, 1, wx.wxEXPAND, 5 )
	
	UI.m_sdbSizer1 = wx.wxStdDialogButtonSizer()
	UI.m_sdbSizer1Save = wx.wxButton( UI.TexturePackerSettings, wx.wxID_SAVE, "" )
	UI.m_sdbSizer1:AddButton( UI.m_sdbSizer1Save )
	UI.m_sdbSizer1Cancel = wx.wxButton( UI.TexturePackerSettings, wx.wxID_CANCEL, "" )
	UI.m_sdbSizer1:AddButton( UI.m_sdbSizer1Cancel )
	UI.m_sdbSizer1:Realize();
	
	UI.bDialogSections:Add( UI.m_sdbSizer1, 1, wx.wxEXPAND, 5 )
	
	
	UI.TexturePackerSettings:SetSizer( UI.bDialogSections )
	UI.TexturePackerSettings:Layout()
	
	UI.TexturePackerSettings:Centre( wx.wxBOTH )
	
  UI.Bindings = {}
  local function notEmpty(item)
      return item and item ~= "" 
    end
    
  local function setBindings()
    
    
    local function setChoice(var, widget)
      if notEmpty(var) then
        widget:SetStringSelection(var)
      end
    end
    
    local function setSpinner(var, widget)
      if var then
        widget:SetValue(var)
      end 
    end
    
    local function setSpinnerPercent(var, widget)
      if var then
        widget:SetValue(var*100)
      end 
    end
    
    local function setCheckbox(var, widget)
      widget:SetValue(var and true or false)
    end
    
    
    
    local function getChoice(widget)
        return widget:GetStringSelection()
    end
    
    local function getSpinner(widget)
        return widget:GetValue()
    end
    
    local function getSpinnerPercent(widget)
      return widget:GetValue()/100
    end
    
    local function getCheckbox(widget)
      return widget:GetValue()
    end
    
    local function addBinding(name, widget, setter, getter)
      table.insert(UI.Bindings, { name = name, widget = widget, setter = setter, getter = getter })
    end
    
    local function bindCheckbox(name, widget)
      addBinding(name, widget, setCheckbox, getCheckbox)
    end
    
    local function bindChoice(name, widget)
      addBinding(name, widget, setChoice, getChoice)
    end
    
    local function bindSpinner(name, widget)
      addBinding(name, widget, setSpinner, getSpinner)
    end
    
    local function bindSpinnerPercent(name, widget)
      addBinding(name, widget, setSpinnerPercent, getSpinnerPercent)
    end
    
    --packer settings
    bindChoice("outputFormat", UI.m_imageFormat)
    bindSpinnerPercent("jpegQuality", UI.m_jpegQuality)
    bindCheckbox("premultiplyAlpha", UI.m_premultiplyAlpha)
    
    --Texture
    bindChoice("format", UI.m_pixelFormat)
    bindChoice("filterMin", UI.m_minFilter)
    bindChoice("filterMag", UI.m_magFilter)
    bindChoice("wrapX", UI.m_wrapX)
    bindChoice("wrapY", UI.m_wrapY)
    
    --Whitespace Stripping
    bindCheckbox("stripWhitespaceX", UI.m_stripWhitespaceX)
    bindCheckbox("stripWhitespaceY", UI.m_stripWhitespaceY)
    bindSpinner("alphaThreshold", UI.m_alphaThreshold)
    
    --page size
    bindSpinner("minWidth", UI.m_minPageWidth)
    bindSpinner("minHeight", UI.m_minPageHeight)
    bindSpinner("maxWidth", UI.m_maxPageWidth)
    bindSpinner("maxHeight", UI.m_maxPageHeight)
    
    bindCheckbox("square",UI.m_forceSquare)
    bindCheckbox("pot",UI.m_pot)
    
    --padding
    bindSpinner("paddingX",UI.m_paddingX)
    bindSpinner("paddingY",UI.m_paddingY)
    
    bindCheckbox("edgePadding", UI.m_edgePadding)
    bindCheckbox("duplicatePadding", UI.m_duplicatePadding)
    bindCheckbox("grid", UI.m_grid)
    
    --Debug
    bindCheckbox("debug", UI.m_debug)
  end
  setBindings()
  
  local function bindUIFrom(settings)
    for _,v in pairs(UI.Bindings) do
      v.setter(settings[v.name],v.widget)
    end
  end
  
  local function bindUITo(settings)
    for _,v in pairs(UI.Bindings) do
      settings[v.name] = v.getter(v.widget)
    end
  end
  
    --output folder
    if notEmpty (outputSettings.OutputFolder) then
      UI.m_outputDir:SetPath(outputSettings.OutputFolder)
    end
    
    if notEmpty(outputSettings.PackName) then
      UI.m_packName:SetValue(outputSettings.PackName)
    end
    
    bindUIFrom(packerSettings)
  
    
  
	-- Connect Events
	
  function UI.GetOutputSettings()
    local s = {}
    s.OutputFolder = UI.m_outputDir:GetPath()
    s.PackName = UI.m_packName:GetValue() 
    if (s.PackName == "") then
      s.PackName = "pack"
    end
    return s
  end
  
  function UI.GetPackerSettings()
    local s = {}
    for k,v in pairs(packerSettings) do
      s[k] = v
    end
    bindUITo(s)
    return s
  end
  
  
  local function validationError(message)
     local dlg = wx.wxMessageDialog(UI.TexturePackerSettings,message,"Validation Error")
     dlg:ShowModal()
     dlg:Destroy()
  end
  
  
	local function validateOutputSettings()
    local s = UI.GetOutputSettings()
    if s.OutputFolder == "" then
      validationError("Output folder is required")
      return false
    end
    
    if not wx.wxFileName.DirExists(s.OutputFolder) then
      validationError("Output folder does not exist")
      return false
    end
    
    return true
  end
  
  
  
	
	UI.m_sdbSizer1Save:Connect( wx.wxEVT_COMMAND_BUTTON_CLICKED, function(event)
	--implements saveClicked
    if validateOutputSettings() then
      UI.TexturePackerSettings:EndModal(0)
    end
   	event:Skip()
	end )
	
return UI
end

return createSettingsDialog
--wx.wxGetApp():MainLoop()
