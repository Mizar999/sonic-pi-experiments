use_debug false

live_loop :wave, sync: :bd do
  use_synth :dsaw
  with_fx :slicer do
    # Wie kann man die folgende Zeile besser klingen lassen?
    play (knit :c4, 3, :e4, 3).look, detune: (knit 1, 6, 5, 2).look, cutoff: rrand(60, 80), sustain: 0.1, release: 0.1 if (spread 5, 8).tick
    with_fx :reverb, mix: 0.7 do
      play [:e4, :f4, :g4].choose, release: 0.2, pan: rdist(0.6) if (spread 5, 8).tick
    end
  end
  sleep 0.25
end

live_loop :bd do
  sample :bd_tek, amp: 2
  sleep 0.5
end

live_loop :hats, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed
  sample :drum_cymbal_open, amp: 0.5, hpf: 120 if (spread 1, 4).tick
  sleep 0.25
  sample :drum_cymbal_pedal, amp: rrand(0.4, 0.5)
  sleep 0.5
  sample :drum_cymbal_pedal, amp: rrand(0.4, 0.5)
end

live_loop :drums, sync: :bd do
  sleep 0.125
  sample :drum_bass_hard, pan: rdist(0.6)
  sleep 0.25
  sample :drum_bass_hard if (spread 1, 2).tick
  sleep 0.125
  sample :drum_bass_hard, pan: rdist(0.6)
  sleep 0.25
  sample :drum_bass_hard if (spread 1, 4).look
  sleep 0.25
end

live_loop :bass, sync: :bd do
  use_synth :dpulse
  use_transpose -8
  with_fx :lpf, cutoff: 70, cutoff_slide: 2 do |lpf|
    play (ring :c4, :e4, :f4, :c4).tick, pulse_width: 0.9, sustain: 1.8, release: 0.2
    control lpf, cutoff: 20
  end
  sleep 2
end
