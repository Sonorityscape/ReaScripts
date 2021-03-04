--[[

Script Name: Reposition Selected Items Prioritizing Higher Tracks 
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: 1.0
Version Last Tested: REAPER v6.23
Description: Repositions the distance between each selected item by a specified amount. The item positioning is
prioritized based items that are on a higher track.

--]]

function get_items_table(all_items)
  
  for i = 0, count_sel_items - 1 do
    
    local item = reaper.GetSelectedMediaItem(0, i) -- also need to get start position of media item
    table.insert(all_items, item)
  
  end
  
  return all_items

end


function main()

  local all_items = {}
  
  local items_table = get_items_table(all_items)
  
  for i = 0, count_sel_items    - 1 do
  
    local item_start = reaper.GetMediaItemInfo_Value(items_table[i + 1], "D_POSITION")
    local item_end = (reaper.GetMediaItemInfo_Value(items_table[i + 1], "D_LENGTH")) + (item_start)
    
    if i + 1 > count_sel_items - 1 then
      
      break
        
    else
      
      reaper.SetMediaItemInfo_Value(items_table[i + 2], "D_POSITION", item_end + distance)
      
    end
    
  end
  
end

count_sel_items = reaper.CountSelectedMediaItems(0)

retval, retvals_csv = reaper.GetUserInputs("Reposition Items on All Tracks", 1, "Distance in Seconds", "1" )
distance = string.match(retvals_csv, "([^,]+)")

if retval then

  main()

end 


