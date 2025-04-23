#!/bin/bash

# Function to print availability blocks
print_availability() {
    local day=$1
    local start_time=$2
    local end_time=$3
    local duration=$(( (end_time - start_time) / 60 ))
#    if [ $duration -ge 30 ]; then
        printf "%s %02d:%02d-%02d:%02d Available\n" "$day" $((start_time/60)) $((start_time%60)) $((end_time/60)) $((end_time%60))
#    fi
}

# Get events for the next 7 days
events=$(icalBuddy -f -n -iep "datetime,title" -po "datetime,title" -df "%Y-%m-%d" -tf "%H:%M" eventsToday+7)

# Initialize variables
current_day=""
last_end_time=0

# Process events
while IFS= read -r line; do
    if [[ $line =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        # New day
        if [ -n "$current_day" ]; then
            print_availability "$current_day" $last_end_time 1440
        fi
        current_day=$line
        last_end_time=0
    elif [[ $line =~ ^([0-9]{2}):([0-9]{2})\ (.*)$ ]]; then
        # Event time
        hour=${BASH_REMATCH[1]}
        minute=${BASH_REMATCH[2]}
        event_time=$((10#$hour * 60 + 10#$minute))

        print_availability "$current_day" $last_end_time $event_time
        last_end_time=$event_time
    fi
done <<< "$events"

# Print availability for the last day
if [ -n "$current_day" ]; then
    print_availability "$current_day" $last_end_time 1440
fi
