# Bruder Jakob

use_bpm 120

2.times do
  play_pattern [:c4, :d4, :e4, :c4]
end

2.times do
  use_synth :pulse
  play_pattern [:e4, :f4], cutoff: 80
  play_pattern_timed [:g4], 2, release: 1.9, cutoff: 90
end

2.times do
  use_synth :dull_bell
  play_pattern_timed [:g4, :a4, :g4, :f4], 0.5
  play_pattern [:e4, :c4]
end

2.times do
  use_synth :hoover
  play_pattern [:d4, :g3]
  play_pattern_timed [:c4], 2, release: 1.9, cutoff: 80, amp: 1.5
end