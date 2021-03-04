--[[

Script Name: Render Selected Tracks Using Time Selection And Mute Originals
Author: Daniel Petras
Contributing Authors: 
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: 1.0
Version Last Tested: REAPER v6.23
Requirements: 
Description: 

Changelog:

Instructions:

--]]

local space_buffer_size = 0 


function Show_Message_List(list)

  for i = 1, #list do

    reaper.ShowConsoleMsg(tostring(list[i]).."\n")
    
  end

end


function Get_Unrendered_Selected_Tracks()

  local unrendered_tracks = {}

  local count_sel_tracks = reaper.CountSelectedTracks(0)
  
  for i = 0, count_sel_tracks - 1 do
  
    table.insert(unrendered_tracks, reaper.GetSelectedTrack(0, i))
  
  end
  
  return unrendered_tracks
  
end


function Render_Selected_Tracks()

  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RS05f8b95199208d372a767a5a54a4e764819756ee"), 1) --Script: Apply render preset - Render Selected Tracks via Master (Time Selection).lua
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSe6ac17702b7ac4fef243a2622db8c56d3d3706ec"), 1) --Script: mpl_Enable add rendered files to project after render.lua
  reaper.Main_OnCommand(42230, 1) --Render project, using the most recent render settings, auto-close render dialog
  
end


function Get_All_Items_And_Tracks()

  local items_to_move = {}
  local selected_tracks = {}
  
  for i = 0, reaper.CountSelectedTracks(0) - 1 do
    
    local sel_track = reaper.GetSelectedTrack(0, i)
    table.insert(selected_tracks, sel_track)
    
    for j = 0, reaper.GetTrackNumMediaItems(sel_track) - 1 do
    
      local item = reaper.GetTrackMediaItem(sel_track, j)
      table.insert(items_to_move, item)
      
    end
    
  end
  
  return items_to_move, selected_tracks
  
end



function Get_Longest_Item(items_to_move)

  local longest_item_len = 0
  local longest_item = nil
  
  for i = 1, #items_to_move do
  
    local item = items_to_move[i]
    local item_len = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    
    if item_len > longest_item_len then
    
      longest_item_len = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
      longest_item = item
    
    end
  
  end
  
  return longest_item_len

end


function Move_Newly_Rendered_Tracks(unrendered_tracks)

  local last_track = unrendered_tracks[#unrendered_tracks]
  local last_track_num = reaper.GetMediaTrackInfo_Value(last_track, "IP_TRACKNUMBER")
  reaper.ReorderSelectedTracks( last_track_num - 1, 0 )
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSfe0993a43171b62e1efb12770c4fc7eb0d8fb6b2"), 1) --Script: X-Raym_Move selected tracks down on visible track list.lua
  
end


function Move_Items(longest_item_len, item_list)

  for i = 1, #item_list do
    
    local item_pos = reaper.GetMediaItemInfo_Value(item_list[i], "D_POSITION")
    reaper.SetMediaItemInfo_Value(item_list[i], "D_POSITION", item_pos + longest_item_len + space_buffer_size)
  
  end

end


function Check_Parent_Folder(selected_tracks)
  
  for i = 1, #selected_tracks do
  
    local parent_track = reaper.GetParentTrack(selected_tracks[i])
    
    if parent_track ~= nil then
    
      return parent_track
    
    end
  
  end

end


function Get_Tracks_With_Parent(selected_tracks)

  local child_tracks = {}

  for i = 1, #selected_tracks do
  
    local parent_track = reaper.GetParentTrack(selected_tracks[i])
    
    if parent_track ~= nil then
    
      table.insert(child_tracks, selected_tracks[i])
    
    end
  
  end
  
  return child_tracks

end


function Move_Tracks_With_Parent(tracks_with_parent, parent_track)

  local parent_track_num = reaper.GetMediaTrackInfo_Value(parent_track, "IP_TRACKNUMBER")
  reaper.Main_OnCommand(40297, 1)
  
  for i = 1, #tracks_with_parent do
  
    reaper.SetTrackSelected( tracks_with_parent[i], 1)
  
  end
  
  reaper.ReorderSelectedTracks(parent_track_num - 1, 0)

end


function Set_Track_Folder_Depth(unrendered_tracks, selected_tracks)

  for i = 1, #unrendered_tracks do
  
    local unren_tr_depth = reaper.GetMediaTrackInfo_Value(unrendered_tracks[i], "I_FOLDERDEPTH")
    reaper.SetMediaTrackInfo_Value(selected_tracks[i], "I_FOLDERDEPTH", unren_tr_depth)
    
  end

end


function Main()

  for i = 0, reaper.CountSelectedTracks(0) - 1 do
  
    local tr = reaper.GetSelectedTrack(0, i)
    tr_depth = reaper.GetMediaTrackInfo_Value(tr, "I_FOLDERDEPTH")
    
    if i == 0 and tr_depth == 1 then
    
      reaper.SetMediaTrackInfo_Value(tr, "I_SELECTED", 0)
      break
    
    end
  
  end

  unrendered_tracks = Get_Unrendered_Selected_Tracks()
  
  Render_Selected_Tracks()
  
  if reaper.CountSelectedTracks(0) <= 0 then
  
    return  
  
  end
  
  reaper.Main_OnCommand(40730, 1) -- Mutes selected tracks
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_UNSELONTRACKS"), 1) --Unselects items on selected tracks
  reaper.Main_OnCommand(40297, 1) -- Unselects all tracks  
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSf5a6e5063d8f79a477e73a183032cac347f28da5"), 1) --Select only tracks of selected items
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_TRACKRANDCOL"), 1)

  item_list, selected_tracks = Get_All_Items_And_Tracks()
  
  longest_item_len = Get_Longest_Item(item_list)
  
  Move_Newly_Rendered_Tracks(unrendered_tracks)
 
  Move_Items(longest_item_len, item_list)

--[[   ***** With currently used render actions, this block is not needed *****

  parent_track = Check_Parent_Folder(selected_tracks) -- Checks to see if all selected tracks have a parent folder
  tracks_with_parent = Get_Tracks_With_Parent(selected_tracks)
  if parent_track ~= nil then
    Move_Tracks_With_Parent(tracks_with_parent, parent_track) -- Moves selected child tracks above their parent
  end
  
--]]

  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RS5efa28a76c337a7c89ef8ad2d15a20011a0fa38b"), 1) --Script: DP - Add Parent Folder With FX To Selected Tracks.lua        

  Set_Track_Folder_Depth(unrendered_tracks, selected_tracks)
  
  reaper.Main_OnCommand(40769, 1)

end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Render Selected Tracks and Reposition", -1)


