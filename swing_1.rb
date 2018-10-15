use_bpm 120

pitch_low = 0 * 12
pitch_mid = 1 * 12
pitch_hi = 2 * 12

swing_amount = 4.8
swing = [ swing_amount / 64*4 , (8.0 - swing_amount) /64*4 ].ring

# pos= [drums low mid hi]
pos =   [0,    0,  0, 0]

# time_tweak = [drums low mid hi]
time_tweak =   [2,     1,  -1, 1]

melody_1 = [:c4,:r,:ds4,:ds4,:g4,:c4,:r,:gs4,:r,:r,:gs3,:r,:g3,:r,:r,:r].ring
melody_2 = melody_1#.shuffle

live_loop :instr_low do
  use_synth :subpulse
  use_synth_defaults cutoff: 70, release: 1.2, amp: 1, pulse_width: rrand(0,1)
  16.times do
    play melody_1[pos[1]] + pitch_low
    sleep swing[pos[1]]
    pos[1]+= time_tweak[1]
  end
end

live_loop :instr_mid do
  use_synth :supersaw
  use_synth_defaults cutoff: rrand(75,120), release: 0.2, amp: rrand(1.0, 1.4)
  with_fx :reverb, mix: 0.55, room: 0.85, damp: 0.8 do
    16.times do
      play melody_1[pos[2]] + pitch_mid
      sleep swing[pos[2]]
      pos[2]+= time_tweak[2]
    end
  end
end

live_loop :instr_hi do
  use_synth :prophet
  use_synth_defaults cutoff: rrand(75,120), release: 0.2, amp: rrand(1.0, 1.4)
  with_fx :reverb, mix: 0.55, room: 0.85, damp: 0.8 do
    16.times do
      play melody_2[pos[3]] + pitch_hi
      sleep swing[pos[3]]
      pos[3]+= time_tweak[3]
    end
  end
end