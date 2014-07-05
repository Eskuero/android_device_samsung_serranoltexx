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

echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem
echo 1 > /sys/module/pm_8x60/modes/cpu0/retention/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/retention/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo 1 > /sys/devices/system/cpu/cpu1/online
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 90000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 1134000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 1026000 > /sys/devices/system/cpu/cpufreq/interactive/sync_freq
echo 80 > /sys/devices/system/cpu/cpufreq/interactive/sync_freq_load_threshold
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 1 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo 1134000 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_freq
echo 70 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_load
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 1 > /dev/cpuctl/apps/cpu.notify_on_migrate
echo 1 > /sys/module/msm_thermal/core_control/enabled
chown -h system.system /sys/devices/system/cpu/mfreq
chmod -h 220 /sys/devices/system/cpu/mfreq
chown -h system.system /sys/devices/system/cpu/cpu1/online
chmod -h 664 /sys/devices/system/cpu/cpu1/online
# Set DCVS parameters for CPU
echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
echo 40000 > /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
echo 100000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_min_us
echo 500000 > /sys/module/msm_dcvs/cores/cpu0/em_win_size_max_us
echo 0 > /sys/module/msm_dcvs/cores/cpu0/slack_mode_dynamic
echo 1000000 > /sys/module/msm_dcvs/cores/cpu0/disable_pc_threshold
echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_max_us
echo 25000 > /sys/module/msm_dcvs/cores/cpu1/slack_time_min_us
echo 100000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_min_us
echo 500000 > /sys/module/msm_dcvs/cores/cpu1/em_win_size_max_us
echo 0 > /sys/module/msm_dcvs/cores/cpu1/slack_mode_dynamic
echo 1000000 > /sys/module/msm_dcvs/cores/cpu1/disable_pc_threshold
# Set DCVS parameters for GPU
echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_max_us
echo 20000 > /sys/module/msm_dcvs/cores/gpu0/slack_time_min_us
echo 0 > /sys/module/msm_dcvs/cores/gpu0/slack_mode_dynamic
# Set msm_mpdecision parameters
echo 45000 > /sys/module/msm_mpdecision/slack_time_max_us
echo 15000 > /sys/module/msm_mpdecision/slack_time_min_us
echo 100000 > /sys/module/msm_mpdecision/em_win_size_min_us
echo 1000000 > /sys/module/msm_mpdecision/em_win_size_max_us
echo 3 > /sys/module/msm_mpdecision/online_util_pct_min
echo 25 > /sys/module/msm_mpdecision/online_util_pct_max
echo 97 > /sys/module/msm_mpdecision/em_max_util_pct
echo 2 > /sys/module/msm_mpdecision/rq_avg_poll_ms
echo 10 > /sys/module/msm_mpdecision/mp_em_rounding_point_min
echo 85 > /sys/module/msm_mpdecision/mp_em_rounding_point_max
echo 50 > /sys/module/msm_mpdecision/iowait_threshold_pct
# Set permissions for the nodes needed by display on/off hook
chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
chown -h system /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
chown -h system /sys/module/msm_mpdecision/slack_time_max_us
chown -h system /sys/module/msm_mpdecision/slack_time_min_us
chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_max_us
chmod -h 664 /sys/module/msm_dcvs/cores/cpu0/slack_time_min_us
chmod -h 664 /sys/module/msm_mpdecision/slack_time_max_us
chmod -h 664 /sys/module/msm_mpdecision/slack_time_min_us

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout

# Post-setup services
start mpdecision
