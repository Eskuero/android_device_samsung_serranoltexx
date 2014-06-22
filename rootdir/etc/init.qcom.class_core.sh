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

# Set platform variables
target=`getprop ro.board.platform`
soc_hwplatform=`cat /sys/devices/system/soc/soc0/hw_platform` 2> /dev/null
soc_hwid=`cat /sys/devices/system/soc/soc0/id` 2> /dev/null
soc_hwver=`cat /sys/devices/system/soc/soc0/platform_version` 2> /dev/null

# Dynamic Memory Managment (DMM) provides a sys file system to the userspace
# that can be used to plug in/out memory that has been configured as unstable.
# This unstable memory can be in Active or In-Active State.
# Each of which the userspace can request by writing to a sys file.
#
# ro.dev.dmm = 1; Indicates that DMM is enabled in the Android User Space. This
# property is set in the Android system properties file.
#
# If ro.dev.dmm.dpd.start_address is set here then the target has a memory
# configuration that supports DynamicMemoryManagement.
init_DMM()
{
    block=-1

    mem="/sys/devices/system/memory"
    op=`cat $mem/movable_start_bytes`
    case "$op" in
    "0")
        log -p i -t DMM DMM Disabled. movable_start_bytes not set: $op
        ;;

    "$mem/movable_start_bytes: No such file or directory ")
        log -p i -t DMM DMM Disabled. movable_start_bytes does not exist: $op
        ;;

    *)
        log -p i -t DMM DMM available. movable_start_bytes at $op
        movable_start_bytes=0x`cat $mem/movable_start_bytes`
        block_size_bytes=0x`cat $mem/block_size_bytes`
        block=$((#${movable_start_bytes}/${block_size_bytes}))

        chown -h system.system $mem/memory$block/state
        chown -h system.system $mem/probe
        chown -h system.system $mem/active
        chown -h system.system $mem/remove

        setprop ro.dev.dmm.dpd.start_address $movable_start_bytes
        setprop ro.dev.dmm.dpd.block $block
        ;;
    esac

return
}

#
# For controlling console and shell on console on 8960 - perist.serial.enable 8960
# On other target use default ro.debuggable property.
#
serial=`getprop persist.serial.enable`
case "$serial" in
    "0")
        echo 0 > /sys/devices/platform/msm_serial_hsl.0/console
        ;;
    "1")
        echo 1 > /sys/devices/platform/msm_serial_hsl.0/console
        start console
        ;;
esac

#
# Allow persistent faking of bms
# User needs to set fake bms charge in persist.bms.fake_batt_capacity
#
fake_batt_capacity=`getprop persist.bms.fake_batt_capacity`
case "$fake_batt_capacity" in
    "") ;; #Do nothing here
    * )
    echo "$fake_batt_capacity" > /sys/class/power_supply/battery/capacity
    ;;
esac

init_DMM
