--[[
@version 1.0
Script Name: Toggle Show Only Soloed Tracks
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts/raw/master/index.xml
Version Last Tested: REAPER v6.23
Requirements: SWS/S&M Extension
Description: A toggle that when on only shows soloed tracks and when off shows all tracks
--]]


function Main()

  reaper.Main_OnCommand(40297, 1) --unselects all tracks
  
  for i = 0, reaper.CountTracks(0) - 1 do
  
    tr = reaper.GetTrack(0, i)
    local is_hidden = reaper.GetMediaTrackInfo_Value(tr, "B_SHOWINTCP")
    
    if is_hidden == 0 then
    
      reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWSTL_SHOWALL"), 1)
      return
    
    end
  end
  
  for i = 0, reaper.CountTracks(0) - 1 do
      
    tr = reaper.GetTrack(0, i)
    is_soloed = reaper.GetMediaTrackInfo_Value(tr, "I_SOLO")
      
    if is_soloed == 2 then
        
      reaper.SetTrackSelected(tr, 1)
      reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWSTL_SHOWTCPEX"), 1)
        
    end
  end
end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Toggle Show Only Soloed Tracks", -1)

