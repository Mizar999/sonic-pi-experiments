use_debug false

####### Settings - Start

riff_seed = 8502#5320
drum_seed = 703

####### Settings - End

live_loop :random_riff do
  use_synth :dsaw
  use_random_seed riff_seed
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle.take(8)
  with_fx :reverb, room: 0.8 do
    8.times do
      play notes.tick, release: rand(0.5), cutoff: rrand(60, 110) if one_in 2
      sleep 0.125
    end
  end
end

live_loop :blade_riff, delay: 16 do
  sync :random_riff
  synth :blade, note: :e4, release: 4, cutoff: 100, amp: 1.5 if (spread 1, 3).tick
  sleep 8
end

live_loop :habanera do
  use_synth :fm
  use_transpose -12
  play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick
  sleep 0.25
end

with_fx :reverb do
  live_loop :space_light, delay: 24 do
    with_fx :slicer, phase: 0.25 do
      synth :blade, note: :d, release: 8, cutoff: 100, amp: 2
    end
    sleep 8
  end
end

live_loop :drums do
  use_random_seed drum_seed
  16.times do
    sample :bd_haus, rate: 2, cutoff: 110 if rand < 0.35
    sleep 0.125
  end
  drum_seed += 1 if tick % 8 == 0
end

live_loop :bd do
  sample :bd_haus, cutoff: 110, amp: 3
  sleep 0.5
end

live_loop :hats do
  sync :bd
  with_fx :slicer, phase: 0.125, probability: 0.8 do
    n, s = (knit [1, 0.25], 3, [2, 0.125], 1, [1, 0.25], 3, [3, 0.125 / 2], 1).tick
    n.times do
      sleep s
      sample :drum_cymbal_open, amp: rrand(0.3, 0.4), pan: rdist(0.6)
    end
  end
end

live_loop :perc do
  sync :bd
  sleep 0.25
  sample :perc_snap, rate: 0.9, cutoff: 110, amp: rrand(0.4, 0.6), pan: rdist(0.6) if (spread 3, 4).tick
end
