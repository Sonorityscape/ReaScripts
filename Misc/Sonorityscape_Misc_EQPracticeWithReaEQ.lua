--[[

Script Name: EQ Practice With ReaEQ
Author: Daniel Petras
Contact: daniel@sonorityscape.com
Website: http://sonorityscape.com/
Repository: https://github.com/Sonorityscape/ReaScripts.git
Script Version: 1.0
Version Last Tested: Reaper 5.941
Description: Test your EQ skills with any combination of randomized frequencies, 
gain levels and and bandwidth settings

Notes: 

- Load ReaEQ into the first FX slot on the first track in Reaper
- Insert audio file onto track 1
- Comment out 'gain' and/or bandwidth to decrease difficulty
- Comment out 'user_input' to remove user input dialogue box
- Comment out 'reset_filter' to remove the option to reset the gain back to unity
- Due to 'math.randomseed(os.time())' parameter changes can only occur every second
- Modify the tables 'freq', 'gain' and 'bandwidth' to add or subtract values

--]]

freq = {100, 500, 1000, 2000, 4000, 8000} 
gain = {3, 6, 9, 12}
bandwidth = {0.5, 1, 2}
--user_input = true
reset_filter = true


math.randomseed(os.time())


-- Gets the table length of the parameter passed in
function table_length(table)
  count = 0
  for _ in pairs(table) do 
    count = count + 1
  end
  return count
end


function Msg(param)
  reaper.ShowConsoleMsg(tostring(param))
end


track = reaper.GetTrack(0, 0)

if track == nil then
  Msg("")
  Msg("Insert ReaEQ into the first FX slot of track 1.")
end


-- Inserts ReaEQ on track 1 if the script is called before the plugin is instantiated
ReaEQ_plugin = reaper.TrackFX_GetEQ(track, true)


Msg("")


-- Grabs a random index from the freq table and sets the parameter in ReaEQ
random_freq = freq[math.random(1, table_length(freq))]
reaper.TrackFX_SetEQParam(track, 0, 2, 0, 0, random_freq, 0)
result_freq = "\nFrequency: "..tostring(random_freq).." Hz"

--[[ Grabs a random index from the gain table, converts it to the 
logarithmic scale and sets the param in ReaEQ--]]
if gain ~= nil then
  answer_gain = gain[math.random(1, table_length(gain))]
  random_gain_log = math.exp(answer_gain * 0.115129254) 
  reaper.TrackFX_SetEQParam(track, 0, 2, 0, 1, random_gain_log, 0)
  if answer_gain > 0 then
    result_gain = "\nGain Boost: "..tostring(answer_gain).." dB"
  else
    result_gain = "\nGain Attenuation: "..tostring(answer_gain).." dB"
  end
end

-- Grabs a random index from the bandwidth table and sets the parameter in ReaEQ
if bandwidth ~= nil then
  random_bandwidth = bandwidth[math.random(1, table_length(bandwidth))]
  reaper.TrackFX_SetEQParam(track, 0, 2, 0, 2, random_bandwidth, 0)
  result_bandwidth = "\nBandwidth: "..tostring(random_bandwidth).." (oct)"
end 


-- Adjusts what the user sees on the input settings according to the difficulty they choose
if user_input ~= nil then
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
if reset_filter ~= nil and gain ~= nil then
  b, user_input = reaper.GetUserInputs("ReaEQ Test - User Input", 1, 'Click \'Ok\' to reset the gain.',"Reset")
  if user_input == "Reset" then
    vol_db = 20*(math.log(random_gain_log, 10)) 
    random_gain_log = (random_gain_log * 1)
    vol_db = vol_db - vol_db
    vol_log = math.exp(vol_db * 0.115129254)
    reaper.TrackFX_SetEQParam(track, 0, 2, 0, 1, vol_log, 0)          
  end
end
