live_loop :drums do
  use_bpm (knit 120, 7, 60, 1).tick(:bpm) if tick % 8 == 0
  sample :bd_haus, lpf: 100, rate: 0.9, amp: 0.8
  sleep 1
end

def bass(n, s)
  n.times do
    sleep s
    sample :drum_bass_hard, rate: 0.7, amp: rrand(0.6, 0.7)
  end
end

live_loop :bass do
  sync :drums
  3.times do bass(1, 0.5) end
  bass(2, 0.25)
  3.times do bass(1, 0.5) end
  bass(3, 0.125)
end

def hats(n, s)
  n.times do
    sleep s
    sample :drum_cymbal_pedal, amp: rrand(0.3, 0.4), pan: rdist(0.6)
  end
end

live_loop :hats do
  sync :drums
  if (spread 3, 8).tick
    hats(2, 0.125)
  else
    hats(1, 0.25)
  end
end
