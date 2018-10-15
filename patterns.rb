use_bpm 124

live_loop :mel do
  use_synth :pluck
  use_random_seed 73264
  play_pattern_timed scale(62, :minor).pick(9), knit(0.5, 6, 0.25, 2, 0.5, 1)
end

live_loop :bd do
  sync :mel
  8.times do |i|
    sample :bd_fat, amp: i / 2.0, rate: 1.2
    sleep 0.5
  end
end

live_loop :bd2 do
  sync :mel
  4.times do
    sleep 0.5
    sample :bd_ada, amp: 3, rate: 0.7
    sample :drum_cymbal_pedal, amp: 0.4, cutoff: 120
    sleep 0.5
  end
end

live_loop :p do
  sync :mel
  8.times do
    sample :perc_snap, amp: 0.4, pan: rdist(0.6, 0) if spread(5, 8).tick
    sleep 0.5
  end
end

live_loop :bass do
  sync :mel
  use_synth :pulse
  use_random_seed 56461
  with_fx :bitcrusher do
    with_fx :echo, phase: 0.9 do
      play_pattern_timed scale(50, :major).pick(4), 1.65, amp: 0.1
    end
  end
end
