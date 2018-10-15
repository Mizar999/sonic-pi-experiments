define :cos do |centre, width, count|
  count.times.map do |index|
    centre + (width * Math::cos(2 * Math::PI * index * (1.0 / count) ))
  end.ring
end

define :cos_slide do |width, count|
  count.times.map do |index|
    width * Math::cos(2 * Math::PI * index * (1.0 / count))
  end.ring
end

define :sin do |centre, width, count|
  count.times.map do |index|
    centre + (width * Math::sin(2 * Math::PI * index * (1.0 / count) ))
  end.ring
end

define :sin_slide do |width, count|
  count.times.map do |index|
    width * Math::sin(2 * Math::PI * index * (1.0 / count))
  end.ring
end

n_cos = cos(:e1, 5, 30)
n_sin = sin(:g3, 3, 30)

play_sounds = false
play_slides = false

live_loop :trig_sounds do
  stop until play_sounds
  t = 0.3
  tick
  with_synth :fm do
    play n_cos.look, release: t, amp: 0.4
  end
  with_synth :blade do
    play n_sin.look, release: t + 0.1, amp: 0.3
  end
  sleep t - 0.1
end

live_loop :trig_slides do
  stop until play_slides
  sl = 0.2
  len = [n_cos.length, n_sin.length].max
  rel = sl * len
  idx = 0
  c = synth :tb303, note: n_cos[idx], release: sl * len, amp: 0.4
  s = synth :fm, note: n_sin[idx], release: sl * len, amp: 0.3
  len.times do
    sleep sl
    idx += 1
    control c, note: n_cos[idx]
    control s, note: n_sin[idx]
  end
end

live_loop :wobble_bass, sync: :bd, auto_cue: false do
  use_bpm 120
  sl = 0.2
  with_fx :wobble, phase: [0.2, 0.3, 0.8].choose, res: 0.0 do
    c = synth :zawa, note: n_cos.first, sustain: sl * n_cos.length, release: sl,
      cutoff: 100, amp: 0.7
    n_cos.rotate(1).each do |note|
      sleep sl
      control c, note: note
    end
    sleep sl #mit synth :zawa wird das Sleep nicht benötigt
  end
end

live_loop :bd do
  density knit(1,3, 2,1).tick do
    sample :bd_klub, amp: 1.2, cutoff: 130
    sleep 0.5
  end
end
