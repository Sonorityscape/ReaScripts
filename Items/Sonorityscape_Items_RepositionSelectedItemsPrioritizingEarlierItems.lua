--[[
@version 1.0
Script Name: Reposition Selected Items Prioritizing Higher Tracks 
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Version Last Tested: REAPER v6.23
Description: Repositions the distance between each selected item by a specified amount. The item positioning is
prioritized based on which items are earlier on the timeline (indpendent of any track).
--]]


function get_items_table(items_table)
  
  table_len = 0
  
  for i = 0, count_sel_items - 1 do
  
    local item = reaper.GetSelectedMediaItem(0, i)
    
    if table_len == 0 then
    
      table.insert(items_table, item)
      
    elseif reaper.GetMediaItemInfo_Value(items_table[1], "D_POSITION") >= reaper.GetMediaItemInfo_Value(item, "D_POSITION") then
     
       table.insert(items_table, 1, item)
       
    elseif reaper.GetMediaItemInfo_Value(items_table[table_len], "D_POSITION") <= reaper.GetMediaItemInfo_Value(item, "D_POSITION") then
       
       table.insert(items_table, table_len + 1, item) 
           
    else 
    
      for i = 1, table_len do
    
        if reaper.GetMediaItemInfo_Value(items_table[i], "D_POSITION") < reaper.GetMediaItemInfo_Value(item, "D_POSITION") and 
        reaper.GetMediaItemInfo_Value(items_table[i + 1], "D_POSITION") >= reaper.GetMediaItemInfo_Value(item, "D_POSITION")  then
        
          table.insert(items_table, i + 1, item)
          
        end
    
      end
      
    end
    
    table_len = table_len + 1
   
  end
  
  return items_table

end


function main()

  items_table = {}
  
  t = get_items_table(items_table)
  
  for i = 0, count_sel_items - 1 do
  
    local item_start = reaper.GetMediaItemInfo_Value(t[i + 1], "D_POSITION")
    local item_end = (reaper.GetMediaItemInfo_Value(t[i + 1], "D_LENGTH")) + (item_start)
    
    if i + 1 > count_sel_items - 1 then
      
      break
        
    else
      
      reaper.SetMediaItemInfo_Value(t[i + 2], "D_POSITION", item_end + distance)
      
    end
    
  end
  
end

count_sel_items = reaper.CountSelectedMediaItems(0)

retval, retvals_csv = reaper.GetUserInputs("Reposition Items on All Tracks", 1, "Distance in Seconds", "1" )
distance = string.match(retvals_csv, "([^,]+)")

if retval then

  main()

end 
  
