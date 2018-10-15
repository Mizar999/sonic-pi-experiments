comment do
  notes = (ring :e3, :e3, :r, :g3, :r, :r, :r, :a3)
  live_loop :riff do
    use_synth :prophet
    play notes.tick, release: 0.5, cutoff: 80
    sleep 0.25
  end
end

use_debug false

live_loop :random_riff do
  # synth :blade, note: :e4, release: 4, cutoff: 100, amp: 1.5
  use_synth :dsaw
  use_random_seed 5320
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle.take(8)
  riff = ""
  with_fx :reverb, room: 0.1 do
    8.times do
      if one_in 2
        play notes.tick, release: rand(0.5), cutoff: rrand(60, 130)
        riff += notes.look.to_s + " "
      else
        riff += ":r "
      end
      sleep 0.125
    end
  end
  puts riff
end

live_loop :habanera do
  use_synth :fm
  use_transpose -12
  play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick
  sleep 0.25
end

with_fx :reverb do
  live_loop :space_light do
    with_fx :slicer, phase: 0.25 do
      synth :blade, note: :d, release: 8, cutoff: 100, amp: 2
    end
    sleep 8
  end
end

live_loop :drums do
  use_random_seed 703
  drums = ""
  16.times do
    if rand < 0.35
      sample :bd_haus, rate: 2, cutoff: 110
      drums += "1 "
    else
      drums += "0 "
    end
    sleep 0.125
  end
  puts drums
end

live_loop :bd do
  sample :bd_haus, cutoff: 110, amp: 3
  sleep 0.5
end
