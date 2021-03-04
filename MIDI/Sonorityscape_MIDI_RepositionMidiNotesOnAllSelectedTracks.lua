--[[

Script Name: Render Selected Tracks Using Time Selection And Mute Originals
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: WIP
Version Last Tested: REAPER v6.23
Requirements: 
Description: Adjusts positioning of all MIDI notes on selected tracks by a specified time interval

--]]



function get_items()
  
  count_sel_items = reaper.CountSelectedMediaItems(0) 
    
  for i = 0, count_sel_items - 1 do  
    
    local item =  reaper.GetSelectedMediaItem(0, i)
    local take = reaper.GetMediaItemTake(item, 0)
    
    expand_item_end()
    
    take_fng = reaper.FNG_AllocMidiTake(take)
    note_count = reaper.FNG_CountMidiNotes(take_fng) 
    
    adjust_note_pos()
    
    --adjust_item_start()
    
  end
  
end




function expand_item_end()
  
  for i = 0, count_sel_items - 1 do
    
    local item = reaper.GetSelectedMediaItem(0, i)
    local item_start = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
    local beat_units_per_second = (1/60) * bpm 
    reaper.MIDI_SetItemExtents(item, (beat_units_per_second * item_start), 100000) 
  
  end

end




function adjust_note_pos()

  all_notes = {}
  
  local notes_table = get_notes_table(all_notes)
  
  
  for i = 0, note_count - 1 do
  
    local note_start = reaper.FNG_GetMidiNoteIntProperty(notes_table[i+1], "POSITION")
    local note_end = (reaper.FNG_GetMidiNoteIntProperty(notes_table[i+1], "LENGTH")) + (note_start)
        
    if i + 1 > note_count - 1 then
        
      break
      
    else
      
      local item = reaper.GetSelectedMediaItem(0, 0) 
      reaper.FNG_SetMidiNoteIntProperty(notes_table[i + 2], "POSITION", note_end + distance)
  
    end  
  
  end
  
  reaper.FNG_FreeMidiTake(take_fng)
  
  get_note_pos()
  
  reaper.UpdateArrange()
  
end




function get_notes_table(all_notes)
  
  for i = 0, note_count - 1 do
    
    local note_fng = reaper.FNG_GetMidiNote(take_fng, i)
    table.insert(all_notes, note_fng)
  
  end
  
  return all_notes

end




function get_note_pos()

  item =  reaper.GetSelectedMediaItem(0, 0)
  take = reaper.GetMediaItemTake(item, 0)
  midi_note_count, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    
  for i = 0, midi_note_count - 1 do
    
    _, _, _, note_start, note_end, _, _, _ = reaper.MIDI_GetNote(take, i)
      
    if i == 0 then
      
      first_note_start = note_start
      
    end
      
    if i + 1 > midi_note_count - 1 then
      
        break
        
    else
            
      __, __, __, note_start_next, note_end_next, __, __, __ = reaper.MIDI_GetNote(take, i + 1)
        
      set_items(first_note_start, note_end_next) 
      
    end
    
  end

end




function set_items(first_note_start, note_end_next)

  count_sel_items =  reaper.CountSelectedMediaItems(0)
  
  for i = 0, count_sel_items - 1 do
    
    local item = reaper.GetSelectedMediaItem(0, i)
    
    local item_start = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
    local item_end = (reaper.GetMediaItemInfo_Value(item, "D_LENGTH")) + (item_start)
    local item_start_converted = item_start * unit_in_seconds -- start position in MIDI units
    local item_end_converted = item_end * unit_in_seconds -- end position in MIDI units
    
    local beat_units_per_second = (1/60) * bpm -- gives the number of beat units in 1 second for current bpm
  
    local adjust_item_start = first_note_start + item_start_converted -- all in midi units
    local adjust_item_end = item_end_converted - (note_end_next + item_start_converted) -- all in midi units
    
    --midi_unit_to_beat_unit = (MIDI units / 16) / 60
    reaper.MIDI_SetItemExtents(item, (beat_units_per_second * item_start), (beat_units_per_second * item_end) - ((adjust_item_end / 16) / 60) + ((distance / 16) / 60))  
  
  end

end



--[[
function adjust_item_start()

  for i = 0, count_sel_items - 1 do
    
    local item = reaper.GetSelectedMediaItem(0, i)
    local item_start = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
    local item_end = (reaper.GetMediaItemInfo_Value(item, "D_LENGTH")) + (item_start)
    local beat_units_per_second = (1/60) * bpm 
    
    take = reaper.GetMediaItemTake(item, 0)
    midi_note_count, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
      
    for j = 0, midi_note_count - 1 do
      
      _, _, _, note_start, note_end, _, _, _ = reaper.MIDI_GetNote(take, j)
        
      if j == 0 then
        
        first_note_start = note_start
        
      end
      
      reaper.MIDI_SetItemExtents(item, (beat_units_per_second * item_start) + ((first_note_start / 16) / 60), (beat_units_per_second * item_end))
      
    end 
  
  end

end
--]]



bpm = reaper.TimeMap_GetDividedBpmAtTime(0)
unit_in_seconds = bpm * 16

retval, retvals_csv = reaper.GetUserInputs("Reposition Midi Notes on Selected Track", 1, "Distance in Seconds", "1" )
distance = string.match(retvals_csv * unit_in_seconds, "([^,]+)")

if retval then

  get_items()

end




