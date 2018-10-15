# ONE SAMPLE MINIMAL TECHNO HIT SONG GENERATOR - LIL XMAS GREETINGS :--D
samplz = :drum_cowbell
kickBasePitch = 0.045

live_loop :beat do
  sleep 1
end

# Grand introduction of the SAMPLE
with_fx :reverb, room: 0.9 do
  sample samplz, amp: 0.8
  sleep 0.5
end

live_loop :BURP1, sync: :beat do
  with_fx :rlpf do
    with_fx :distortion, mix: 0.1 do
      32.times do
        sample samplz, rate: kickBasePitch + range(-0.01, 0.01, 0.0001).mirror.tick, cutoff: 50, start: 0.5, finish: 0.55, release: 0.2, amp: 4
        sleep 0.5
      end
      with_fx :reverb, room: 1 do
        sample :ambi_choir, amp: 1.15
        with_fx :distortion do
          2.times do
            7.times do
              sample samplz, hpf: 85, rate: 0.25 + range(0, 0.16, 0.01).mirror.tick, cutoff: 60, start: 0.35, finish: 0.48, release: 0.2, amp: 6
              sleep 0.5
            end
            4.times do
              sample samplz, hpf: 85, rate: 0.25 + [0.1, 0.16, 0.2, 0.26].choose, cutoff: 60, start: 0.35, finish: 0.48, release: 0.2, amp: 6
              sleep 0.125
            end
          end
        end
      end
    end
  end
end

with_fx :reverb, damp: 1.0, room: 0.3, mix: 0.7 do
  live_loop :BURP2, sync: :beat do
    with_fx :rhpf, cutoff: 100 do
      128.times do
        with_fx :tremolo do
          sample samplz, start: 0.08, finish: 0.15, release: 0.2, amp: 0.5, rate: 5
        end
        with_fx :ring_mod, mix: 1, freq: 2 do
          
          sample samplz, start: 0.67, finish: 0.75, release: 0.1, amp: 2, rate: 0.5 + range(-0.03, 0.03, 0.001).mirror.tick, pan: [-0.55, 0.55, -0.25, 0.25].ring.look
          sleep (2.0/16.0)
        end
      end
      sleep 8
    end
  end
end