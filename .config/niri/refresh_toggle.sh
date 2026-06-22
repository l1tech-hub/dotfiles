

OUTPUT="eDP-1"

CURRENT=$(wlr-randr | awk -v out="$OUTPUT" '
$1==out {found=1}
found && /current/ {print; exit}
')

if echo "$CURRENT" | grep -q "165.003"; then
    wlr-randr --output $OUTPUT --mode 2560x1440@60Hz
else
    wlr-randr --output $OUTPUT --mode 2560x1440@165.003Hz
fi

