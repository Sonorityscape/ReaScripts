--[[
@version 1.0
Script Name: Search Marker Names And Go To Marker
Author: Daniel Petras
Contributing Authors: 
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts/raw/master/index.xml
Version Last Tested: REAPER v6.23
Requirements: SWS/S&M Extension 
Description: Shows a list of markers with alphabetized names to move the cursor to

--]]

function Main()

  reaper.ClearConsole()
  
  retval, num_markers, num_regions = reaper.CountProjectMarkers(0)
  
  function CloseConsole()
    local title = reaper.JS_Localize('ReaScript console output', "common")
    local hwnd = reaper.JS_Window_Find(title, true)
    if hwnd then reaper.JS_Window_Destroy(hwnd) end  
  end
  
  function first_to_upper(str)
    return (str:gsub("^%l", string.upper))
  end
  
  t = {}
  
  for i = 0, num_markers - 1 do
   
    retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(i)
    name = first_to_upper(name)
    
    if t[name] then
      t[name] = t[name] .. ", " .. markrgnindexnumber
    else
      t[name] = markrgnindexnumber
    end
  
  end
  
  a = {}
  
  for n in pairs(t) do 
    table.insert(a, n) 
  end
  
  table.sort(a)
  
  reaper.ShowConsoleMsg("Marker Positions".."\n--------------------------\n\n\n")
  
  for i, n in ipairs(a) do 
    
    for k, v in pairs(t) do
    
      if n == k then
        reaper.ShowConsoleMsg(n .. " ---- " .. v .. "\n")
      end
    
    end
  
  end
  
  retval_input, retvals_csv = reaper.GetUserInputs("Search Marker Names", 1, "Move Cursor To Marker Number", "1" )
  marker_number = string.match(retvals_csv, "([^,]+)")
  marker_number = marker_number - 1
  
  if retval_input then
    
    retval_marker, isrgn, marker_pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(marker_number)
    cursor_pos = reaper.GetCursorPosition()
    reaper.MoveEditCursor(marker_pos - cursor_pos, false)
    reaper.Main_OnCommand(1016, 1) -- stop playback from marker movement 
    
  end
  
  CloseConsole()
  
end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Render Selected Tracks and Reposition", -1)




