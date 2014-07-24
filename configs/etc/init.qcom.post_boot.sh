#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Enable Power modes
echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem

echo 1 > /sys/module/pm_8x60/modes/cpu0/retention/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/retention/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/retention/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/retention/idle_enabled

echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled

echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled

# CPUFreq default settings
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo 1 > /sys/devices/system/cpu/cpu1/online
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chown system.system /sys/devices/system/cpu/cpu1/online
chmod 664 /sys/devices/system/cpu/cpu1/online

# Interactive governor settings
echo 90000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 1026000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 1026000 > /sys/devices/system/cpu/cpufreq/interactive/sync_freq
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 1 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo 1026000 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_freq
echo 70 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_load

echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate
echo 1 > /sys/module/msm_thermal/core_control/enabled

echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout
