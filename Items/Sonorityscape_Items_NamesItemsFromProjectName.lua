--[[
@version 1.0
Script Name: Names Items From Project Name
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts/raw/master/index.xml
Version Last Tested: REAPER v6.23
Description: Names and increments items from project names
--]]

function Get_Item_Increment(increment)

  if increment >= 10 then
  
    return increment + 1  
    
  else
  
    return "0"..increment + 1
    
  end

end


function Check_UCS_Name(project_name, project_name_start)

  if string.find(project_name, project_name_start) then
  
    project_name_start = string.sub(project_name, string.find(project_name, project_name_start))
    return true, project_name_start 
    
  else
  
    return false
  
  end

end


function Name_Items(project_name_start, project_name_end)

  for i = 0, reaper.CountSelectedMediaItems(0) - 1 do
  
    local item = reaper.GetSelectedMediaItem(0, i)
    local take = reaper.GetMediaItemTake(item, 0)
    
    if project_name_end == nil then
    
      reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", project_name_start..Get_Item_Increment(i), true)
    
    else
    
      reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", project_name_start..Get_Item_Increment(i)..project_name_end, true)
    
    end
  
  end

end


function Main()

  local project_name = reaper.GetProjectName( 0, "ProjectName" )
  local project_name_start = "%a+-?%a*_%w+"
  
  if project_name:sub(-4, -1) == ".rpp" then
  
    project_name = project_name:sub(1,-5)
    
  end
  
  retval, project_name_start = Check_UCS_Name(project_name, project_name_start)
  
  if retval then
  
    local project_name_len = string.len(project_name)
    local project_name_start_len = string.len(project_name_start)
    local project_name_end_pos = project_name_start_len - project_name_len -- from the end of string (should be negative value)
    local project_name_end = string.sub(project_name, project_name_end_pos) 
  
    Name_Items(project_name_start, project_name_end)
    
  else
  
    Name_Items(project_name)
    
  end

end


reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Names Items From Project Name", -1)

