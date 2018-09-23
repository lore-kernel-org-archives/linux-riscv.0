From: marcus@lysator.liu.se (Marcus Comstedt)
Date: Sun, 23 Sep 2018 14:49:52 +0200
Subject: mmcqd/0 stuck at 100% CPU
Message-ID: <q3worc5qfj.fsf@armitage.lysator.liu.se>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org


Hi.

I'm writing this mail to inform about an issue with the SDcard driver on
the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
from git + patch-4.15.18.xz from kernel.org).

Due to the great impact and ease of reproduction (for me at least :) I
figured that this was a known issue, but some discussion on #riscv
indicated that it was not and that I should take it to the list.

The issue is that after some days of uptime, the mmcqd/0 kernel thread
starts consuming 100% CPU and never stops, while any and all processes
which attempt to write to the sdcard gets stuck in device wait.

First of all, I'm aware that the driver is very CPU intense, and that it
is normal for it to consume a lot of CPU at times.  However, the
situation I'm talking about here differs from the normal case where
mmcqd/0 consumes 100% in two ways:

1) There is no activity from the spi2 kernel thread.  Normally when
   mmcqd/0 performs a lot of work, spi2 also performs a measurable
   amount of work.

2) There is no progress being made.  The processes that are stuck in
   device wait remain so forever (forever beging > 48 hours at least).
   Only a reboot will stop mmcqd/0 from taking 100% CPU and allow
   progress to happen again.

My setup is the following:  I'm running Gentoo 17.0 with an ext3
partition on the sdcard as root filesystem, the mount options being
(rw,noatime,discard,data=ordered).

In normal operation, there is no performance issue with the root
filesystem being on the sdcard; due to the large amount of memory on the
Unleashed everything ends up in buffer cache pretty soon, and I use RAM
disks for any build directories (such as PORTAGE_TMPDIR).

The workload on the system consists of a cron job that every hour will
try to download a new version of a source archive and compile it if it
exists.  The compilation happens on a RAM disk, but the source archive
and some logs are written to the root filesystem.  When the issue
happens, all the cron jobs immediately get stuck in device wait, and can
be observed in top with one entry per hour for as long as the system is
kept running.

I last booted the system up this Friday evening.  After startup, top
showed the following for mmcqd/0 and spi2:

  69 root   20   0    0   0   0 S   0,0   0,0   0:17.64   spi2
  74 root   20   0    0   0   0 S   0,0   0,0   2:58.01   mmcqd/0

I checked on the system again on Saturday evening, and it was still
running fine, with top showing

  69 root   20   0    0   0   0 S   0,0   0,0   0:22.95   spi2
  74 root   20   0    0   0   0 S   0,0   0,0   3:58.92   mmcqd/0

Uptime here was 27 hours 39 minutes, with mmcqd/0 having run for an
average of 0.25% of the available uptime, and spi2 consuming 10% of the
amount of CPU time that mmcqd/0 does.

Then this (Sunday) morning when I checked again, and the issue had
occured.  top now showed:

  69 root   20   0    0   0   0 S   0,0   0,0   0:23.45   spi2
  74 root   20   0    0   0   0 S 100,0   0,0 453:18.51   mmcqd/0

This was after 38 hours 39 minutes of uptime.  Checking again 2 hours 35
minutes later showed

  69 root   20   0    0   0   0 S   0,0   0,0   0:23.56   spi2
  74 root   20   0    0   0   0 S 100,0   0,0 608:35.23   mmcqd/0

So mmcqd/0 has been running at 100% the entire time, while spi2 had not
consumed any significant amount of CPU time.

Processes stuck in device wait this morning (it was probably activity
caused by "mandb --quiet" that triggered the issue in this particular
instance):

root     78  0.0  0.0     0     0 ?   D    Sep21   0:00 [jbd2/mmcblk0p2-]
root  13118  0.0  0.0  7116  5772 ?   DN   03:10   0:10 mandb --quiet
root  31440  0.0  0.0     0     0 ?   D    Sep21   0:00 [kworker/u8:1]

and now:

root     78  0.0  0.0     0     0 ?   D    Sep21   0:00 [jbd2/mmcblk0p2-]
root  13118  0.0  0.0  7116  5772 ?   DN   03:10   0:10 mandb --quiet
root  31440  0.0  0.0     0     0 ?   D    Sep21   0:00 [kworker/u8:1]

So no progress at all during these 2.5 hours.

So what is mmcqd/0 doing?  Checking /proc/74/stack gives one of three
results:

# cat /proc/74/stack
[<0>] __schedule+0x1c6/0x4ea
[<0>] 0xffffffffffffffff
# cat /proc/74/stack
[<0>] __schedule+0x1c6/0x4ea
[<0>] blk_fetch_request+0x12/0x56
[<0>] mmc_queue_thread+0x56/0xf6
[<0>] kthread+0xcc/0xde
[<0>] ret_from_syscall+0xa/0xe
[<0>] 0xffffffffffffffff
# cat /proc/74/stack
[<0>] __schedule+0x1c6/0x4ea
[<0>] _cond_resched+0x16/0x4c
[<0>] mmc_queue_thread+0x56/0xf6
[<0>] kthread+0xcc/0xde
[<0>] ret_from_syscall+0xa/0xe
[<0>] 0xffffffffffffffff
#

Checking status and sched:

# cat /proc/74/status
Name:   mmcqd/0
Umask:  0022
State:  R (running)
Tgid:   74
Ngid:   0
Pid:    74
PPid:   2
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 64
Groups:
NStgid: 74
NSpid:  74
NSpgid: 0
NSsid:  0
Threads:        1
SigQ:   0/63960
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: ffffffffffffffff
SigCgt: 0000000000000000
CapInh: 0000000000000000
CapPrm: 0000003fffffffff
CapEff: 0000003fffffffff
CapBnd: 0000003fffffffff
CapAmb: 0000000000000000
NoNewPrivs:     0
Cpus_allowed:   1f
Cpus_allowed_list:      0-4
voluntary_ctxt_switches:        11969
nonvoluntary_ctxt_switches:     2779541
# cat /proc/74/sched
mmcqd/0 (74, #threads: 1)
-------------------------------------------------------------------
se.exec_start                                :     149619956.713000
se.vruntime                                  :      41541824.313512
se.sum_exec_runtime                          :      37687051.115000
se.nr_migrations                             :                   67
nr_switches                                  :              2791517
nr_voluntary_switches                        :                11969
nr_involuntary_switches                      :              2779548
se.load.weight                               :              1048576
se.runnable_weight                           :              1048576
se.avg.load_sum                              :                47675
se.avg.runnable_load_sum                     :                47675
se.avg.util_sum                              :             48733486
se.avg.load_avg                              :                 1023
se.avg.runnable_load_avg                     :                 1023
se.avg.util_avg                              :                 1023
se.avg.last_update_time                      :      149619956712448
policy                                       :                    0
prio                                         :                  120
clock-delta                                  :                    0
# 

Also, I've attached the output from sysrq-t.

There are no errors printed to dmesg, and as long as writes to the sdcard
are avoided, the system can be used normally.

Perhaps also of interrest is the contents of
/sys/class/block/mmcblk0/stat.  Two snapshots taken 10 minutes apart:

   10251     5098   254209   223400     6874    30872   371741 30496260   2 39464030 109152380
   10251     5098   254209   223400     6874    30872   371741 30496260   2 40108480 110441280

So, io_ticks and time_in_queue increase like crazy (no big surpise
there), and there are two requests in_flight.  None of the "requests
processed" or "sectors read/write" fields increase, which supports the
perception of no progress being made at all.  I don't know if it's
relevant that neither "read ticks" or "write ticks" increase; does it
mean that the requests in flight are neither read nor write requests?

Any ideas on what else I can do (code instrumentation is fine) to help
find out how this situation is possible and how to fix it?

Thanks.


  // Marcus


-- 
--------------------------------------------------------------------------
Marcus Comstedt                          Lysator Academic Computer Society
marcus at lysator.liu.se                    Link?ping University, Sweden   //
----------------------------------------------------------------------\X/-

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: h5u-sysreq-t.txt
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180923/ae0c28e6/attachment.txt>
