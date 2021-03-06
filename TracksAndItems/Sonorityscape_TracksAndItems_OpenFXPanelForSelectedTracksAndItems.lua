--[[
@version 1.0
Script Name: Open FX Panel For Selected Tracks And Items
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts/raw/master/index.xml
Version Last Tested: REAPER v6.23
Description: Opens FX panel for selected tracks and items
Instructions: Select one or multiple tracks and/or items and run script
--]]

count_sel_tracks = reaper.CountSelectedTracks(0)
count_sel_items = reaper.CountSelectedMediaItems(0)
  

-- Opens the track FX panels for all selected tracks
function Tracks()
  
  for i = 0, count_sel_tracks - 1 do
  
    track = reaper.GetSelectedTrack(0, i)
    num_fx = reaper.TrackFX_GetCount(track)
    reaper.TrackFX_SetOpen(track, num_fx - 1, true)
    
  end

end

-- Opens all take FX panels for all selected media items
function Media_Items()
  
  for i = 0, count_sel_items - 1 do
    
    media_item = reaper.GetSelectedMediaItem(0, i)
      
    for j = 0, reaper.CountTakes(media_item) - 1 do
      
      take = reaper.GetMediaItemTake(media_item, j)
      num_fx = reaper.TakeFX_GetCount(take)
      reaper.TakeFX_SetOpen(take, num_fx - 1, true)
      
    end
  
  end

end


function Main()

  -- Creates a track and then selects it if the track count is 0 in the project
  master = reaper.GetMasterTrack(0)
  is_master_selected = reaper.IsTrackSelected(master)

  if is_master_selected == true then

  Tracks()
  Media_Items()
  reaper.Main_OnCommand(40846, 0)

  elseif count_sel_tracks == 0 and count_sel_items == 0 then
    
    reaper.Main_OnCommand(40001, 0) --53789
    Tracks()

  elseif count_sel_items >= 1 and count_sel_tracks == 0 then
    
    Media_Items()
    
  elseif count_sel_items == 0 and count_sel_tracks >= 1 then

    Tracks()
    
  else

    Media_Items()
    Tracks()
      
  end

end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Open FX Panel For Selected Tracks And Items", -1)


