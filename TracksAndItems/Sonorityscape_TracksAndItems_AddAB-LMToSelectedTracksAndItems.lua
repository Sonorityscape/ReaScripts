--[[
@version 1.0
Script Name: Add AB_LM To Selected Tracks And Items
Author: Daniel Petras 
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Version Last Tested: REAPER v6.25
Description: Adds AB_LM to selected tracks and items ignoring specified default track plugins
--]]

default_track_plugin = "Multichannel Volume Trim 2" -- Add exact names of default track plugin you want to ignore. It should appear first in the FX order
gain_matching_plugin = "AB_LM" -- Add exact name of your 'AB_LM' plugin

function add_plugin_track(fx_start_index, tr)

  reaper.TrackFX_AddByName(tr, gain_matching_plugin, false, -1)
  local num_fx = reaper.TrackFX_GetCount(tr)
  reaper.TrackFX_CopyToTrack(tr, num_fx - 1, tr, fx_start_index, true)
  reaper.TrackFX_AddByName(tr, gain_matching_plugin, false, -1)

end

function add_plugin_item(item)
  
  tk = reaper.GetMediaItemTake(item, 0)
  reaper.TakeFX_AddByName(tk, gain_matching_plugin, -1)
  local num_fx = reaper.TakeFX_GetCount(tk)
  reaper.TakeFX_CopyToTake(tk, num_fx - 1, tk, 0, true)
  reaper.TakeFX_AddByName(tk, gain_matching_plugin, -1)

end

function main()

  reaper.PreventUIRefresh(1)
  reaper.Undo_BeginBlock()
  
  count_sel_tracks = reaper.CountSelectedTracks(0)
  
  for i = 0, count_sel_tracks - 1 do

    local tr = reaper.GetSelectedTrack(0, i)
    local fx = reaper.TrackFX_GetByName(tr, default_track_plugin, false)

    if fx == 0 then

      add_plugin_track(1, tr)

    else

      add_plugin_track(0, tr)
      
    end

  end
  
  count_sel_items = reaper.CountSelectedMediaItems(0)
  
  for i = 0, count_sel_items - 1 do
  
    local item = reaper.GetSelectedMediaItem(0, i)
    
    add_plugin_item(item)
    
  end

end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Add AB_LM To Selected Tracks And Items", -1)