for d in /sys/class/hwmon/hwmon*; do
    if [ -f "$d/name" ] && grep -q "^coretemp$" "$d/name"; then
        if [ -f "$d/temp1_input" ]; then
            value=$(cat "$d/temp1_input")
            echo $((value / 1000))
            exit 0
        fi
    fi
done

exit 1
