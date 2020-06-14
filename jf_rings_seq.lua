--- just friends poly sequencer

function init()
    
    metro[1].event = n
    metro[1].time = 0.4
    metro[1]:start()
    metro[2].event = switchDiad
    metro[2].time = 1
    metro[2]:start()
    metro[3].event = incMax
    metro[3].time= 6
    metro[3]:start()
end

lydian = {0,2,4,6,7,9,11,12}
penta = {0,2,4,7,9}
scale = lydian
scaleIndex = 1
scaleIndex2 = 1

local offset = 1
local offset_max = 1
local offset2 = 1 

function switchDiad()
    offset = (offset % offset_max) + 1 
end

function incMax()
    offset_max = offset_max % 7 + 1
end

level = 3

function n()
    for n=1,1 do
        scaleIndex = (scaleIndex + offset) % #scale + 1
        scaleIndex2 = (scaleIndex2) % #scale + 1
        local note = scale[scaleIndex]/12
        local note2 = scale[scaleIndex2]/12
        ii.jf.play_note(note, level) 
        output[1].volts = note2
        --scaleIndex = scaleIndex % #ourscale + 1
    end
end 