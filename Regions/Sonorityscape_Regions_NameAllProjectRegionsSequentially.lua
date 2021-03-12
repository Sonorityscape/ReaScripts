--[[
@version 1.0
Script Name: Name All Project Regions Sequentially
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Version Last Tested: REAPER v6.25
--]]


function get_region_info()

  cursor_pos = reaper.GetCursorPositionEx(0)
  markeridx, regionidx = reaper.GetLastMarkerAndCurRegion(0, cursor_pos)
  retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(regionidx)

end

function main()

  reaper.GoToRegion(0, 1, false)
  get_region_info()
  
  string_ending_one = string.find(name, " %d%d")
  string_ending_two = string.find(name, " %d%d%d")
  
  if string_ending_one ~= nil then
    
    updated_string_one = string.sub(name, 1, -4)
    b, user_input = reaper.GetUserInputs("Name Regions and Variations", 1, 'Enter Region Name.', updated_string_one)
    
    else if string_ending_two ~= nil then
      
      updated_string_two = string.sub(name, 1, -5)
      b, user_input = reaper.GetUserInputs("Name Regions and Variations", 1, 'Enter Region Name.', updated_string_two)
      
    else
    
      b, user_input = reaper.GetUserInputs("Name Regions and Variations", 1, 'Enter Region Name.', name)
    
    end
  
  end
  
  if b then
  
    retval, num_markers, num_regions = reaper.CountProjectMarkers(0)
    
    for i = 1, num_regions do
    
      reaper.GoToRegion(0, i, false)
      get_region_info()
      
      reaper.SetProjectMarker3(0, i, true, pos, rgnend, user_input.."_0"..tostring(i), reaper.ColorToNative(255,255,255)|0x1000000)
    
    end
    
  end
 
end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Add AB_LM To Selected Tracks And Items", -1)


