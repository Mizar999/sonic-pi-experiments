use_debug false
use_bpm 120

live_loop :pulseA do
    use_synth :chipbass
    play :c4
    sleep 1
end

live_loop :pulseB do
    use_synth :chipbass
    sleep 0.5
    play :c5
    sleep 1
end

live_loop :triangle do
    use_synth :chiplead
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
    use_synth :chipnoise
    sleep 0.25
    play :c4
    sleep 0.75
end