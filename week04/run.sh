#!/bin/bash

echo "n,lin,quad,matmult" > out
RESULT=""
format_output() {
	echo $1 | awk '{ print $2 }'
	RAW=$(echo $1 | awk '{ print $2 }')
	MINS=$(echo $RAW | cut -d "m" -f 1)
	SECS=$(echo $RAW | cut -d "m" -f 2 | sed s/s//)
	RESULT=$(echo "$MINS * 60 + $SECS" | bc)
}

for num in {100..1000..100}
do
	OUTPUT="$num,"

	printf "Running lin with n=$num takes...      "
	TIME=$(time (./lin $num > /dev/null) 2>&1)
	format_output "$TIME"
	OUTPUT=$OUTPUT$RESULT','

	printf "Running quad with n=$num takes...     "
	TIME=$(time (./quad $num > /dev/null) 2>&1)
	format_output "$TIME"
	OUTPUT=$OUTPUT$RESULT','

	printf "Running matmult with n=$num takes...  "
	perl gen-matrix.pl -n $num > mat.$num
	perl gen-matrix.pl -n $num >> mat.$num
	TIME=$(time (./matmult $num $num $num $num < mat.$num > /dev/null) 2>&1)
	format_output "$TIME"
	OUTPUT=$OUTPUT$RESULT

	echo $OUTPUT >> out
	echo ""
done