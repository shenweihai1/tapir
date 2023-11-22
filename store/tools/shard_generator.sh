nshards=$1

format_integer() {
    # Check if the number of arguments is correct
    if [ "$#" -ne 1 ]; then
        echo "Usage: format_integer <number>"
        return 1
    fi

    # Extract the integer from the command line argument
    input_number=$1

    # Check if the input is a positive integer less than 1000
    if ! [[ "$input_number" =~ ^[0-9]+$ ]] || [ "$input_number" -ge 1000 ]; then
        echo "Error: Please enter a positive integer less than 1000."
        return 1
    fi

    # Format the integer to a string of length 3 with leading zeros
    formatted_number=$(printf "%03d" "$input_number")

    echo "$formatted_number"
}

for ((i = 0; i < nshards; i++)); do
    port=$(format_integer $i)
    context="f 1\nreplica s0:51$port\nreplica s1:52$port\nreplica s2:53$port"

    file="shard$i.config"
    
    echo -e $context > $file
done
