# Transmission - Joy Division
# Stephen O'Connor

use_debug true

live_loop :bass do
  play_pattern_timed [:b2]*15+[:e2],                     0.2, release: 0.1
  play_pattern_timed [:a2]*15+[:e2],                     0.2, release: 0.1
  play_pattern_timed [:b2]*15+[:e2],                     0.2, release: 0.1
  play_pattern_timed [:a2]*8,                            0.2, release: 0.1
  cue :fill
  play_pattern_timed [:cs3,:d3]*2+[:e3]*3+[:e2],         0.2, release: 0.15
  cue :introdone
end

live_loop :kickdrum do
  sync :introdone
  loop do
    sample :drum_bass_hard, amp: 0.7
    sleep 0.2
    sample :drum_bass_soft
    sleep 0.6
  end
end

live_loop :hihat do
  sync :introdone
  loop do
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.2
  end
end

live_loop :snare do
  sync :introdone
  loop do
    with_fx :reverb do
      sleep 0.4
      sample :drum_snare_hard
      sleep 0.4
    end
  end
end

live_loop :tomfill do
  loop do
    sync :fill
    5.times do
      sample :drum_tom_lo_hard
      sleep 0.1
    end
    sleep 0.3
    5.times do
      sample :drum_tom_lo_hard
      sleep 0.1
    end
  end
end

live_loop :ambient do
  with_fx :krush do
    sample :ambi_dark_woosh , decay: rrand(1,4)
    sleep rrand(8,20)
  end
end