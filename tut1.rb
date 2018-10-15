use_bpm 123

live_loop :drums do
  tick
  sample :drum_heavy_kick, on: spread(1,4).look
  sample :drum_cymbal_open, on: bools(0,0,1,0).look, sustain: 0.05, release: 0.1, amp: line(0.2, 0.8, steps: 3).look
  
  sleep 0.25
end

live_loop :bd do
  #sync :drums
  sample :bd_haus, on: spread(3, 5).tick
  sleep 1
end
