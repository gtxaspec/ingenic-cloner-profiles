#!/bin/sh

# Directory where the backup files are located
backup_dir=.

# Output file
output_file="${backup_dir}/fw_backup_full_combined.bin"

# Start with a fresh output file
:> "$output_file"

# Concatenate the files
for i in $(seq 0 31); do
    part="${backup_dir}/fw_backup_${i}.bin"
    [ ! -f "$part" ] && break
    cat "$part" >> "$output_file"
done

echo "All files have been concatenated into ${output_file}"
