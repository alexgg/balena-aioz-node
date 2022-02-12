#!/usr/bin/env bash

# Wait for X server. See: https://github.com/balenablocks/xserver#waiting-for-xserver-to-start
while ! xset -q; do sleep 0.5; done

# Run base image entrypoint
/usr/bin/entry.sh echo "Running balena base image entrypoint..."

# This stops the CPU performance scaling down
echo "Setting CPU Scaling Governor to 'performance'"
echo 'performance' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# https://github.com/electron/electron/issues/17972
/usr/src/app/aioz_worker_node --no-sandbox
