in_thread(name: :piano) do
  loop do
    with_fx :reverb do
      use_synth :piano
      4.times do
        play_chord chord(:c3, :minor), amp: 1.5
        sleep 1
      end
      4.times do
        play_chord chord(:g2, :minor), amp: 1.5
        sleep 1
      end
    end
  end
end

define :drums do
  live_loop :drums do
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
  end
end

define :hat do
  live_loop :hat do
    sample :drum_tom_hi_soft
    sleep 0.25
  end
end

define :music do
  live_loop :music do
    use_synth :tb303
    16.times do
      play :c3 ,amp: 0.5
      sleep 0.25
    end
    16.times do
      play :g2, amp: 0.5
      sleep 0.25
    end
  end
end

sleep 8
drums

sleep 8
hat

sleep 32
music
