use_bpm 120

live_loop :rythm do
  with_fx :level, amp: 1 do
    sample :drum_cymbal_closed if (spread 11, 16).tick
    sample :drum_bass_hard if spread(5, 16).look
    sample :drum_snare_hard if (spread 2, 16).rotate(4).look
    sleep 0.25
  end
end

live_loop :bass do
  sync :rythm
  with_fx :level, amp: 1 do
    use_synth :tb303
    play (scale :a2, :minor_pentatonic).choose, release: 0.3 if (spread 3, 8).tick
    sleep 0.5
  end
end
