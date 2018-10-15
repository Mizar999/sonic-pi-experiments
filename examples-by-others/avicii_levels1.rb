notes = (ring :fs3, :e3, :e3, :r, :e3, :e3, :e3, :e3, :ds3, :ds3, :e3, :e3,
         :r, :cs4, :b3, :gs3, :fs3, :e3, :e3, :r, :e3, :e3, :e3, :e3, :cs3,
         :c3, :b2, :b2, :r, :cs4, :b3, :gs3)

live_loop :mel, sync: :bd do
  use_synth :dpulse
  use_transpose 2
  with_fx :reverb, room: 0.8 do
    notes.length.times do
      play notes.tick, release: 0.18, cutoff: 110
      sleep 0.25
    end
  end
end

live_loop :bd do
  sample :bd_tek, amp: 2
  sleep 0.5
end

live_loop :drums, sync: :bd do
  use_sample_defaults amp: 1.5, rate: 0.9
  sample :drum_bass_hard if (spread 5, 8).tick
  if (spread 3, 8).look
    sleep 0.125
    sample :drum_bass_hard
    sleep 0.125
  else
    sleep 0.25
  end
end
