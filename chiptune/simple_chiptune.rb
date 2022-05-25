use_debug false
use_bpm 120

live_loop :pulseA do
    use_synth :pulse
    play :c4
    sleep 1
end

live_loop :pulseB do
    use_synth :pulse
    sleep 0.5
    play :c5
    sleep 1
end

live_loop :triangle do
    use_synth :tri
    play :e2
    sleep 0.75
    play :g2
    sleep 0.75
    play :b2
    sleep 0.75
    play :e2
    sleep 0.75
end

live_loop :noise do
    use_synth :fm
    use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
    sleep 0.25
    play :c4
    sleep 0.75
end