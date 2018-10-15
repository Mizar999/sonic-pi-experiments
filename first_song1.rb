live_loop :drums do
  use_bpm 120
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end

live_loop :perc do
  n = [1, 2, 3, 5, 7].choose # choose a prime number
  
  n.times do # repeat n-times (n equals chosen prime number)
    sample :perc_snap2, amp: 0.5
    sleep 0.25
  end
  
  if n == 3 # if it was prime number '3'
    sample :perc_till
  else # if it wasn't prime number '3'
    sample :perc_swash
  end
  sleep 0.5
end

live_loop :bass do
  use_synth :fm
  play :c2, attack: 0, release: 0.25
  sleep 0.25
  play :c2, attack: 0, release: 0.3
  sleep 2
  play_pattern_timed [:e2, :f2], [0.75, 1]
end

live_loop :melody do
  if one_in 6
    use_transpose 2
  else
    use_transpose 0
  end
  play_pattern_timed [:c4, :e4, :f4, :g4, :f4, :g4, :f4, :e4, :f4],
    [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25],
    attack: 0, release: 0.2
end
