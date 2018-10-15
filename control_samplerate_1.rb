live_loop :crush do
  sam = (ring :loop_mika, :loop_compus, :loop_weirdo).choose
  dur = sample_duration(sam)
  with_fx :bitcrusher, sample_rate: 1000, sample_rate_slide: dur do |bc|
    sample sam, rate: 1
    control bc, sample_rate: (ring 100, 2000, 4000, 8000).choose
    sleep dur
  end
end