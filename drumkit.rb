define :drumkit do |kits = {}|
  
  max_index = kits.values.map{|e| e.size}.max || 0
  sleep 0.25 if max_index == 0
  
  0.upto(max_index - 1) do |i|
    kits.each do |key, value|
      case value.ring[i]
      when "X" then sample key, amp: 2
      when "x" then sample key, amp: 1
      else sample key, amp: value.ring[i].to_f/10
      end
    end
    sleep 0.25
  end
  
end

use_bpm 120

live_loop :drums do
  #stop
  drumkit(
    :bd_haus   => "-X-x-XX--x-x-x-x-x-xxXXX",
    :bd_ada    => "xx--x--x---x---xx---x-xx",
    :sn_dolf   => "--55-5-5--4--4-43--5-5-5",
    :elec_tick => "4-3-3-43--43--43-344--3-",
    :bd_808    => "--6--3--66"
  )
end

live_loop :drums2 do
  stop
  drumkit(
    :bd_klub     => "-x-X-xxX-x-X--XX",
    :elec_cymbal => "1---1-1--1-11-1-"
  )
end
