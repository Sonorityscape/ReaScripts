--[[
@version 1.0
Script Name: Set Traveler Peak Points With Markers
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Versions Last Tested: REAPER v6.25; Traveler 1.1.2
Requirements: SWS/S&M Extension 
Description: This script creates markers in Reaper that highlight the doppler peak points of the Plugin "Traveler" by Tonsturm
Instructions: 
- Select all tracks that are being processed by Traveler
- Set the "TIMECODE" (in Traveler) to seconds and make sure "LOOP" is turned on
- Move your cursor to where you want the doppler effect to begin
- Run the script, set the "PEAK TIME"
- Reset Markers: "Yes" will clear all markers within a time selection and create updated markers. "No" will move the play cursor (back) to the "Doppler Start" marker 
--]]

--------------User Settings--------------

plugin_name = "VST: TRAVELER (Tonsturm)" -- Make sure this string has the same spelling as your FX name

-----------------------------------------


function Msg(param)

    reaper.ShowConsoleMsg(tostring(param))

end

function ColorTracks()

    reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_RANDOMCOLALL"), 1) -- SWS: Set selected track(s) to one random custom color
    local tr = reaper.GetSelectedTrack(0, 0)
    return reaper.GetTrackColor(tr)

end

function GetFirstTrackWithTraveler()

    for i = 0, reaper.CountSelectedTracks(0) - 1 do

        local tr = reaper.GetSelectedTrack(0,i)
        
        for j = 0, reaper.TrackFX_GetCount(tr) - 1 do

            local retval, buf = reaper.TrackFX_GetFXName(tr, j, "buf")

            if buf == plugin_name then
                
                local retval, retvals_csv = reaper.GetUserInputs("Set Traveler Peak Points With Markers", 2, "Enter PeakTime (in seconds),Reset Markers, This is a test", "1,Yes")
                local peak_time, reset_markers = string.match(retvals_csv, "([^,]+),([^,]+)")
                return peak_time, reset_markers, tr, j
            
            end
        end
    end

    reaper.ShowMessageBox( "Traveler not found on selected track(s).", "Set Traveler Peak Points With Markers", 0 )

end

function GetDopplerDuration(tr, fxid)

    local retval, minval, maxval = reaper.TrackFX_GetParam(tr, fxid, 3)
    local retval, param_string = reaper.TrackFX_FormatParamValue( tr, fxid, 3, retval, "buf" )
    param_string = param_string:sub(1, -5)
    local param_num = tonumber(param_string)

    if param_num == nil then 
        
        reaper.ShowMessageBox( "Make sure the timecode is set to seconds.", "Set Traveler Peak Points With Markers", 0 )
    
    else
        
    
        return param_num

    end 
end

function CreateCursorPosStartMarker(marker_color)

    for i = 0, reaper.CountProjectMarkers(0) - 1 do 

        local retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(i)

        if name == "Doppler Start" then reaper.DeleteProjectMarkerByIndex(0, i) end
        
    end

    local cursor_pos = reaper.GetCursorPosition()
    reaper.AddProjectMarker(0, false, cursor_pos, 0, "Doppler Start", 0)
    reaper.SetProjectMarker3(0, 0, false, cursor_pos, 0, "Doppler Start", marker_color)

    return cursor_pos

end

function GetLastItemEnd()

    local last_item_end_pos = 0

    for j = 0, reaper.CountSelectedTracks(0) - 1 do
        
        local sel_tr = reaper.GetSelectedTrack(0, j)

        for i = 0,  reaper.CountTrackMediaItems(sel_tr) - 1 do 

        local item = reaper.GetTrackMediaItem(sel_tr, i)
        local item_end = reaper.GetMediaItemInfo_Value(item, "D_POSITION") + reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
        
            if item_end > last_item_end_pos then
                
                last_item_end_pos = item_end
            
            end
            
        end

    end

    return last_item_end_pos

end

function CreatePeakMarkers(cursor_pos, peak_time, doppler_duration, last_item_end, marker_color)

    local j = 1

    for i = 0, 20 do

        if i == 0 and (cursor_pos + peak_time) < last_item_end then
            
            reaper.AddProjectMarker(0, false, cursor_pos + peak_time, 0, "", i + 1)
            reaper.SetProjectMarker3(0, i + 1, false, cursor_pos + peak_time, 0, "", marker_color)

        else

            if (cursor_pos + ((doppler_duration * j) - (doppler_duration - peak_time))) < last_item_end then  
            
                reaper.AddProjectMarker(0, false, cursor_pos + ((doppler_duration * j) - (doppler_duration - peak_time)), 0, "", i + 1)
                reaper.SetProjectMarker3(0, i + 1, false, cursor_pos + ((doppler_duration * j) - (doppler_duration - peak_time)), 0, "", marker_color)

            end
        end
        
        j = j + 1
    
    end
end

function MoveCursorToStartMarker()

    local cursor_pos = reaper.GetCursorPosition()

    for i = 0, reaper.CountProjectMarkers(0) - 1 do

        local retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(i)

        if name == "Doppler Start" then
            
            reaper.MoveEditCursor(pos - cursor_pos, false)
            
        end
    end
end

function Main()

    local peak_time, reset_markers, tr, fxid = GetFirstTrackWithTraveler()

    if peak_time == nil then return end
    
    if reset_markers == "Yes" then

        local tr_color = ColorTracks()

        reaper.Main_OnCommand(40420, 1) -- Remove all markers from time selection
    
        local doppler_duration = GetDopplerDuration(tr, fxid)

        if doppler_duration == nil then return end

        local cursor_pos = CreateCursorPosStartMarker(tr_color)

        local last_item_end = GetLastItemEnd()

        CreatePeakMarkers(cursor_pos, peak_time, doppler_duration, last_item_end, tr_color)

    else
    
        MoveCursorToStartMarker()

    end
end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
Main()
reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Render Selected Tracks and Reposition", -1)

