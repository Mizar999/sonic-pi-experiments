oxygen = "/midi/oxygen_49/0/1/note_on"
oxy_pads = "/midi/oxygen_49/0/10/note_on"
synthi = :supersaw

live_loop :midi_oxygen do
  use_real_time
  note, vel = sync oxygen
  synth synthi, note: note, amp: vel / 127.0
end

live_loop :midi_oxy_pads do
  use_real_time
  note, vel = sync oxy_pads
  case note
  when 36
    synthi = :fm
  when 38
    synthi = :zawa
  when 42
    synthi = :piano
  when 46
    synthi = :pluck
  else
    synthi = :supersaw
  end
end