#!/usr/bin/env bash

# Output directory
output_dir="cards"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through numeric values 1 to 10 and generate cards
for value in {1..10} "J" "Q" "K" "A"; do
    echo "Generating cards for value: $value"
    for type in "spades" "hearts" "diamonds" "clubs"; do
        echo "  Type: $type"
        ./cardgen --value "$value" --type "$type" --size 30 --output_dir $output_dir
    done
done

echo "All cards generated successfully."