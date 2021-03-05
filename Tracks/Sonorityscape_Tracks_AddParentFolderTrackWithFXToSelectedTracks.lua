--[[
@version 1.0
Script Name: Add Parent Folder Track With FX To Selected Tracks
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: 1.0
Version Last Tested: REAPER v6.23
Requirements: SWS/S&M Extension
Description: Adds folder track with desired FX to selected tracks
--]]

--------------User Settings--------------

parent_track_fx_name = "Fabfilter Pro-L 2" -- Add parent track fx name

-----------------------------------------

function Main()

  local tr = reaper.GetSelectedTrack(0, 0)
  local tr_color = reaper.GetTrackColor(tr)
  
  for i = 0, reaper.CountSelectedTracks(0) - 1 do
  
    local last_folder_track = reaper.GetSelectedTrack(0, i)
    
  end
  
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_INSRTTRKABOVE"), 1) -- Adds track above selected tracks
  local tr_parent = reaper.GetSelectedTrack(0, 0)
  reaper.SetTrackColor(tr_parent, tr_color)
  
  reaper.SetMediaTrackInfo_Value(tr_parent, 'I_FOLDERDEPTH', 1)
  reaper.TrackFX_AddByName(tr_parent, parent_track_fx_name, false, 1)
  reaper.SetMediaTrackInfo_Value(last_folder_track, 'I_FOLDERDEPTH', -1)
  
end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Add Parent Folder Track With FX To Selected Tracks", -1)


