chords = (ring (chord :e3, :minor), (chord :e3, :minor), (chord :a3, :minor), (chord :a3, :minor),
          (chord :a3, :minor), (chord :g3, :minor), (chord :g3, :minor), (chord :g3, :minor),
          (chord :g3, :minor), (chord :e3, :minor), (chord :e3, :minor), (chord :e3, :minor))

live_loop :melody do
  use_synth :piano
  with_fx :reverb, mix: (ring 0.7, 0.55, 0.4).tick do
    with_fx :slicer, mix: 0.6 do
      play_chord chords.look, release: rrand(0.2, 0.22), amp: rrand(1, 1.2)
    end
  end
  sleep 0.25
end

live_loop :beat do
  with_fx :level, amp: (ring 1, 1, 0.8, 0.9).tick do
    sample :bd_haus, cutoff: 100
    sleep 0.25
    sample :bd_klub, cutoff: 90 if (spread 7, 8).look
    sleep 0.25
  end
end

live_loop :hats do
  sync :beat
  sample (ring :drum_cymbal_open, :drum_cymbal_pedal).tick, pan: rrand(-0.7, 0.7), rate: 2, amp: rrand(0.3, 0.4)
end

live_loop :perc do
  sync :beat
  sample (ring :perc_snap, :perc_snap, :perc_snap2, :perc_snap).tick, pan: rrand(-0.8, 0.8),
    rate: 0.7, cutoff: 84, amp: 0.6
end
