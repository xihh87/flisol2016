index.html:Q: cifrado.md
	pandoc \
		-t dzslides \
		-s \
		-o $target \
		cifrado.md 
	echo $target

watch_%: cifrado.md
	while true; do
		inotifywait $prereq -e modify || true
		mk $stem
		pkill surf || true
		surf $stem &
	done

w_%: cifrado.md
	while true; do
		inotifywait $prereq -e modify || true
		mk $stem
		for w in `xdotool search --class surf`; do
			xdotool windowfocus $w
			xdotool key ctrl+r
		done
	done