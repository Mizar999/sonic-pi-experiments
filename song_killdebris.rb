#KillFlaggHauss_V1

fibo = 1.618034

fibodiv = 1/fibo

fibobpm = 55/fibodiv

use_bpm fibobpm


live_loop :biet do
  sleep 2
end

set :killflag1,false
with_fx :level,amp: 0 do |v|
  at 0 do #fade in volume
    control v,amp: 2,amp_slide: 5
  end
  at 90 do #initiate closedown
    control v,amp: 0,amp_slide: 10
    sleep 10
    set :killflag1,true
  end
  with_fx :gverb,room: 25, mix: 0.6 do
    live_loop :soundDebris1, sync: :biet do
      use_random_seed rrand(-282828,282828)
      stop if get(:killflag1)
      with_fx :bpf,centre: rrand(60,150) do
        sample :drum_heavy_kick,onset: rrand_i(0,9),rate: rrand(-2,2),pan: [-1,0,1].choose if spread(5,8).tick
        sample :drum_cymbal_pedal,onset: rrand_i(0,13),rate: rrand(-2,2),pan: [-1,0,1].choose if !spread(5,8).look
        sleep [0.25,1,0.5,2,4].choose
        #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
      end
    end
  end
end


sleep 16


with_fx :reverb do
  
  live_loop :beathaus1, sync: :biet do
    sample [:bd_haus, :bass_hit_c].choose, rate: rrand(0.88,0.98), cutoff: rrand(90, 120), amp: rrand(0.5,2.1)
    sleep [0.25,1,2,0.5,0.5].choose
    #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
  end
  
  sleep 4
  
  live_loop :beathaus2, sync: :biet do
    sample [:bd_gas, :bd_haus, :bd_tek, :bass_hit_c].choose, rate: rrand(0.58,0.68), cutoff: rrand(90, 120), amp: rrand(0.5,1.1)
    sleep [0.25,1,0.5,2].choose
    #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
  end
  
  sleep 4
  
  live_loop :beathaus3, sync: :biet do
    16.times do
      with_fx :bitcrusher do
        sample [:bd_haus, :bass_hit_c].choose, rate: rrand(0.68,0.98), cutoff: rrand(90, 120), amp: rrand(0.5,2.1)
        sleep [0.5,0.5,0.25, 0.75, 1].choose
        #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
      end
    end
    sleep 16
  end
  
end

sleep 4


with_fx :gverb do
  live_loop :luuppibiitti1, sync: :biet do
    use_random_seed rrand(-2828,2828)
    
    s = 8
    sample :loop_compus, beat_stretch: s, amp: rrand(0.3,0.8)
    sleep s+s
  end
end

sleep 4

with_fx :flanger do
  live_loop :luuppibiitti2, sync: :biet do
    use_random_seed rrand(-282828,282828)
    
    s = 8
    sample :loop_compus, beat_stretch: s, amp: rrand(0.6,2.8)
    sleep s+s+s
  end
end

sleep 4

live_loop :drums, sync: :biet do
  
  sample [:bd_haus, :sn_dolf, :drum_tom_hi_soft].ring.tick
  a = 8
  a.times do
    sample :drum_tom_hi_soft, release: rrand(-0.5,0.5)
    sample :drum_bass_soft, release: rrand(-0.3,0.9)
    sleep [0.25,0.5,0.25,1,2].choose
    #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
  end
  sleep 4
end

sleep 8

in_thread do
  use_synth :pnoise
  #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
  sleep [0.25,1,0.5,2,4].choose
  live_loop :loop1, sync: :biet do
    8.times do
      sample [:bd_haus, :bass_hit_c].choose, amp: rrand(fibo,fibo+fibo)
      
      sample [:bd_haus, :bass_hit_c].choose, rate: rrand(0.88,0.98), cutoff: rrand(90, 120), amp: rrand(0.5,2.1)
      sample :drum_tom_hi_hard, release: rrand(-fibodiv,fibodiv), amp: rrand(fibodiv,fibo)
      #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
      sleep [0.25,1,0.5].choose
      play :e2, release: rrand(0.001,fibodiv), rate: rrand(-fibodiv,fibodiv)
      sample :perc_snap2, rate: fibo, amp: rrand(fibodiv,fibo+fibo)
      sample [:bd_gas, :bd_haus, :bd_tek, :bass_hit_c].choose, release: rrand(-fibodiv, fibodiv)
      #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
      sleep [0.25,1,0.5].choose
    end
    #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
    sleep [0.25,1,0.5,2,4].choose
  end
end

sleep 4

live_loop :hihat1, sync: :biet do
  sample :drum_cymbal_pedal, amp: rrand(0.2,2.6), release: rrand(0.25,1.8)
  sleep [0.25,1,0.5,2,4].choose
  #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
end

sleep 8

live_loop :hihat2, sync: :biet do
  sample :drum_cymbal_soft, amp: rrand(0.2,2.6), release: rrand(0.25,1.8)
  sleep [0.25,1,0.5,2,4].choose
  #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
end

sleep 4

live_loop :hihat3, sync: :biet do
  sample :drum_tom_hi_soft, amp: rrand(0.2,2.6), release: rrand(0.25,1.8)
  sleep [1,0.5,2,4].choose
  #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
end

sleep 4

with_fx :distortion do
  
  live_loop :monte, sync: :biet do
    sleep 13
    with_synth [:prophet,:tech_saws, :dark_ambience, :blade].choose do
      with_fx :ixi_techno, phase_offset: 0.5, phase: 50 do
        play :b3, amp: rrand(0.2,1.2), attack: 21, release: 13, pan: -0.89
        play :fs4, amp: rrand(0.4,1.4), attack: 21, release: 13, pan: 0.89
      end
      sleep 55
    end
  end
  
  
  
  sleep 34
  
  set :killflag2,false
  with_fx :level,amp: 0 do |v|
    at 0 do #fade in volume
      control v,amp: 2,amp_slide: 5
    end
    at 60 do #initiate closedown
      control v,amp: 0,amp_slide: 10
      sleep 10
      set :killflag2,true
    end
    with_fx :reverb,room: 0.25, mix: 0.6 do
      live_loop :soundDebris2, sync: :biet do
        stop if get(:killflag2)
        use_random_seed rrand(-282,282)
        with_fx :bpf,centre: rrand(60,150) do
          sample :drum_heavy_kick,onset: rrand_i(0,9),rate: rrand(-2,2),pan: [-1,0,1].choose if spread(5,8).tick
          sample :drum_cymbal_pedal,onset: rrand_i(0,13),rate: rrand(-2,2),pan: [-1,0,1].choose if !spread(5,8).look
          sleep [0.25,1,0.5,2,4].choose
          #sleep [fibo,fibodiv,fibodiv,fibodiv].choose
        end
      end
    end
  end
  
end