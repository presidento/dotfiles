function fish_right_prompt
    set -q CMD_DURATION; or set CMD_DURATION 0
    set -l duration_in_sec (math "$CMD_DURATION/1000")
    if test $duration_in_sec -gt 60
        set_color yellow
    else
        set_color brgrey
    end
    date -u -d @$duration_in_sec +"%M:%S"
    set_color normal
end
