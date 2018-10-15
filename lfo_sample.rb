
live_loop :lfo_sample do
  p = (ring 1, -1)
  s = sample :loop_amen, beat_stretch: 4, pan: p.look, pan_slide: 1
  4.times do
    control s, pan: p.tick
    sleep 1
  end
end
