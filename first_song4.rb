live_loop :eucid_beat do
  sample :elec_bong, amp: 1.3 if (spread 3, 8).tick
  sample :perc_snap, amp: 0.8 if (spread 7, 11).look
  sample :bd_haus, amp: 1.7 if (spread 1, 4).look
  sleep 0.125
  
  unless spread(1, 3).look
    sample :bd_haus, amp: 1.3, detune: 0.2
    sleep 0.125 / 4
  end
end

live_loop :melody do
  #stop
  sync :eucid_beat
  with_fx :reverb, mix: 0.6 do
    if (spread 4, 6).tick
      use_synth :piano
      play (scale :c, :major_pentatonic).choose, release: rrand(0.45, 0.5), pan: rrand(-0.7, 0.7), amp: rrand(1.2, 1.5)
    end
    sleep 0.25
  end
end

live_loop :cym do
  sync :eucid_beat
  with_fx :flanger, amp: 0.5 do
    sample :drum_cymbal_open, rate: 2, cutoff: rrand(100, 110)
    sleep 0.5
    sample :drum_cymbal_soft, amp: 1.2, rate: 1.3
    sleep 0.5
  end
end

live_loop :bass do
  use_synth :dtri
  with_fx :ixi_techno do
    play :e2, release: 0.3
    sleep 0.25
    play :g2, release: 0.2
    sleep 0.25
    play :f2, amp: rrand(0.8, 1)
    sleep (ring 1, 1.25).tick
    play :a2, release: 0.5
    sleep 0.5
  end
end
