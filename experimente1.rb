use_bpm 65

def set_current_chord(index = 0)
  chords_ring = (ring (chord :c, :major), (chord :d, :major))
  @current_chord = chords_ring[index]
  select_next_note
end

def select_next_note
  @current_note = (scale @current_chord[0], :major_pentatonic).choose
end

set_current_chord

with_fx :reverb do
  live_loop :acmp do
    use_synth :subpulse
    use_transpose -3
    with_fx :slicer do
      play @current_chord.tick, release: rrand(0.2, 0.4), amp: 1.5
    end
    set_current_chord(tick(:chords)) if look % 8 == 0
    sleep 0.25
  end
end

live_loop :melody, sync: :acmp do
  use_synth :tb303
  with_fx :ixi_techno, phase: 0.4 do
    with_fx :slicer, phase: 0.125 do
      play @current_note, sustain: 0.2, release: rrand(0.2, 0.3), amp: 0.7, cutoff: 85 if tick % 3 == 0
    end
  end
  select_next_note if one_in 2
  sleep 0.125
end

live_loop :bd do
  sample :bd_ada, amp: 3
  sleep 0.5
end
