--[[

Script Name: EQ Practice With ReaEQ
Description: Test your EQ skills with any combination of randomized frequencies, 
gain levels and bandwidth settings
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: 1.1
Version Last Tested: Reaper 6.23
Version History:
1.0
- Launch
1.1
- ReaEQ can be inserted into any FX slot position
- ReaEQ will now be instantiated onto the first selected track
- The 'gain' in User Settings can be left blank. It will default to 0dB
- If the 'bandwidth is left blank, it will default to 1
- If you remove all frequencies from the User Settings the script will prompt user to add at least one
- 'user_input' and 'reset_filter' can be set to false instead of previously having to comment them out 

Notes: 

- Load ReaEQ into any FX slot on any selected track in Reaper
- Insert audio file onto track with ReaEQ
- Modify the tables 'freq', 'gain' and 'bandwidth' to increase or decrease difficulty
- Set user_input and/or reset_filter to toggle those settings

--]]

--------------User Settings--------------

freq = {100, 200, 500, 1000, 2000, 5000} 
gain = {1, 3, 6}
bandwidth = {0.5, 1, 2}
user_input = true
reset_filter = true

-----------------------------------------

math.randomseed(os.time())
local track =  reaper.GetSelectedTrack(0, 0)
local track_fx_num = 0

-- Gets the table length of the parameter passed in
function table_length(table)
  local count = 0
  for _ in pairs(table) do 
    count = count + 1
  end
  return count
end

function Msg(param)
  reaper.ShowConsoleMsg(tostring(param))
end

-- Inserts ReaEQ on track 1 if the script is called before the plugin is instantiated
reaper.TrackFX_GetEQ(track, true)

for i = 0, reaper.TrackFX_GetCount(track) - 1 do

  local retval, buf = reaper.TrackFX_GetFXName(track, i, "what")
  
  if string.find(buf, "ReaEQ") then
  
    track_fx_num = i
    break
    
  end

end

Msg("")

-- Grabs a random index from the freq table and sets the parameter in ReaEQ
if table_length(freq) == 0 then

  local message = "Please enter at least one frequency in the User Settings."
  Msg(message)
  return 

end
random_freq = freq[math.random(1, table_length(freq))]
reaper.TrackFX_SetEQParam(track, track_fx_num, 2, 0, 0, random_freq, 0)
result_freq = "\nFrequency: "..tostring(random_freq).." Hz"

--[[ Grabs a random index from the gain table, converts it to the 
logarithmic scale and sets the param in ReaEQ --]]
if gain ~= nil then

  if table_length(gain) == 0 then
    answer_gain = 0
  else
    answer_gain = gain[math.random(1, table_length(gain))]
  end

  random_gain_log = math.exp(answer_gain * 0.115129254) 
  reaper.TrackFX_SetEQParam(track, track_fx_num, 2, 0, 1, random_gain_log, 0)
  
  if answer_gain > 0 then
    result_gain = "\nGain Boost: "..tostring(answer_gain).." dB"
  else
    result_gain = "\nGain Attenuation: "..tostring(answer_gain).." dB"
  end

end

-- Grabs a random index from the bandwidth table and sets the parameter in ReaEQ
if bandwidth ~= nil then

  if table_length(bandwidth) == 0 then
    answer_bandwidth = 1
  else
    answer_bandwidth = bandwidth[math.random(1, table_length(bandwidth))]
  end
  
  reaper.TrackFX_SetEQParam(track, track_fx_num, 2, 0, 2, answer_bandwidth, 0)
  result_bandwidth = "\nBandwidth: "..tostring(answer_bandwidth).." (oct)"
end 

-- Adjusts what the user sees on the input settings according to the difficulty they choose
if user_input == true then
  if bandwidth == nil and gain == nil then
    b, user_input = reaper.GetUserInputs
    ("ReaEQ Test - User Input", 1, 'What is the frequency?',"")
  elseif gain == nil then
    b, user_input = reaper.GetUserInputs
    ("ReaEQ Test - User Input", 1, 'Frequency and bandwidth?',"")
  elseif bandwidth == nil then
    b, user_input = reaper.GetUserInputs
    ("ReaEQ Test - User Input", 1, 'Frequency and gain?',"")
  else
    b, user_input = reaper.GetUserInputs
    ("ReaEQ Test - User Input", 1, 'Frequency gain and bandwidth?',"")
  end
  Msg("Your answer: "..user_input.."\n")
end

-- Shows the randomly set values of the ReaEQ paramteters in the console
Msg("\nThe correct answer is...\n")

Msg(result_freq)

if gain ~= nil then  
  Msg(result_gain)
end

if bandwidth ~= nil then
  Msg(result_bandwidth)
end

-- Converts volume in dB back to logarithmic and resets the gain to unity
if reset_filter == true then
  b, user_input = reaper.GetUserInputs("ReaEQ Test - User Input", 1, 'Click \'Ok\' to reset the gain.',"Reset")
  if user_input == "Reset" then
    vol_db = 20*(math.log(random_gain_log, 10)) 
    random_gain_log = (random_gain_log * 1)
    vol_db = vol_db - vol_db
    vol_log = math.exp(vol_db * 0.115129254)
    reaper.TrackFX_SetEQParam(track, track_fx_num, 2, 0, 1, vol_log, 0)          
  end
end
