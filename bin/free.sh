#!/bin/sh

# Determine OS
uname=$(uname)

# Build stats
if [ $uname = 'Darwin' ]; then
escecho='echo'
cachename='speculative'

# Get total/swap stats from sysctl
totalMem=$(sysctl -n hw.memsize)

allSwap=$(sysctl -n vm.swapusage | sed 's/M//')

swapTotal=$(echo $allSwap | awk '{ print $3 }' | awk -F . '{ print $1*1048576 + $2*10486}')
swapUsed=$(echo $allSwap | awk '{ print $6 }' | awk -F . '{ print $1*1048576 + $2*10486}')
swapFree=$(echo $allSwap | awk '{ print $9 }' | awk -F . '{ print $1*1048576 + $2*10486}')

# Get the rest from vm_stat
vmStats=$(vm_stat | sed 's/\.//')

pagesFree=$(echo "$vmStats" | awk '/Pages free:/ { print $3*4096 }')
pagesActive=$(echo "$vmStats" | awk '/Pages active:/ { print $3*4096 }')
pagesInactive=$(echo "$vmStats" | awk '/Pages inactive:/ { print $3*4096 }')
pagesSpeculative=$(echo "$vmStats" | awk '/Pages speculative:/ { print $3*4096 }')
pagesWired=$(echo "$vmStats" | awk '/Pages wired down:/ { print $4*4096 }')

elif [ $uname = 'FreeBSD' ]; then
escecho='echo -e'
cachename='cache'
pageSize=$(sysctl -n hw.pagesize)

# Get all stats from sysctl
totalMem=$(sysctl -n hw.realmem)

swapTotal=$(sysctl -n vm.swap_total)
# FIXME: Is this right? No swapping systems to test
swapUsed=$(($(sysctl -n vm.stats.vm.v_swappgsout) * $pageSize))
swapFree=$(($swapTotal - $swapUsed))

# Top's UFS buffers are not used separate in calculation
pagesFree=$(($(sysctl -n vm.stats.vm.v_free_count) * $pageSize))
pagesActive=$(($(sysctl -n vm.stats.vm.v_active_count) * $pageSize))
pagesInactive=$(($(sysctl -n vm.stats.vm.v_inactive_count) * $pageSize))
pagesSpeculative=$(($(sysctl -n vm.stats.vm.v_cache_count) * $pageSize))
pagesWired=$(($(sysctl -n vm.stats.vm.v_wire_count) * $pageSize))

else
echo "Unsupported uname: $(uname)"
exit 1
fi

# Print out Linux-style memory stats
$escecho "\ttotal\t\tused\t\tfree\t\tinactive\t$cachename"
$escecho "Mem:\t$totalMem\t$(($totalMem - $pagesFree))\t$pagesFree\t$pagesInactive\t$pagesSpeculative"
$escecho "-/+ inact/$cachename:\t$(($pagesActive + $pagesWired))\t$(($pagesFree + $pagesInactive + $pagesSpeculative))"
$escecho "Swap:\t$swapTotal\t$swapUsed\t$swapFree"