--[[
@version 1.0
Script Name: Move Item Under Mouse Cursor Down One Track
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Version Last Tested: REAPER v6.25
--]]


num_tracks_down = 1 -- defines how many tracks down to move the item

reaper.Main_OnCommand(40297, 1) -- unselects all tracks

count_tr = reaper.CountTracks(0)

function get_position() -- get item position; move cursor; set item track selected

  reaper.Main_OnCommand(40528, 1) -- select item under mouse cursor
  item = reaper.GetSelectedMediaItem(0, 0)
  
  if item then
  
    reaper.Main_OnCommand(40698, 1) --copy from clipboard
    item_pos = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
    cursor_pos = reaper.GetCursorPosition()
    item_cursor_diff = cursor_pos - item_pos
    reaper.MoveEditCursor(-item_cursor_diff, true)
    track = reaper.GetMediaItem_Track(item)
    reaper.SetTrackSelected(track, true)
    
  else
  
    --reaper.ShowMessageBox( "Select a media item.", "Move Item Under Cursor Down One Track", 0)
    
  end
  
end

function move_item(i) -- copy and pastes item to new track; deletes old item

  local tr = reaper.GetTrack(0, i + num_tracks_down)
  
  if tr then
  
    reaper.SetTrackSelected(tr, true)
    reaper.SetOnlyTrackSelected(tr)
    reaper.Main_OnCommand(40914,0) -- set as last touched track
    reaper.SetMediaTrackInfo_Value(track, "I_SELECTED", 0)
    reaper.SetTrackSelected(tr, true)
    reaper.Main_OnCommand(40006, 1) -- remove item; comment out line if you want to keep original item
    reaper.Main_OnCommand(40058, 1) -- paste from clipboard
    
  else
  
    --reaper.ShowMessageBox( "Add additional track(s) below selected media item track.", "Move Item Under Cursor Down One Track", 0)
  
  end

end

get_position()

for i = 0, count_tr - 1 do
  
  local tr = reaper.GetTrack(0, i)
  local is_track_sel = reaper.IsTrackSelected(tr)
  
  if is_track_sel then
  
    move_item(i)
    
    break
      
  end
  
end

