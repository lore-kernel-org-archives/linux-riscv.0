Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A2DC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 01:38:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0942145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 01:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1faSoXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0942145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XsIyjEgt24Gr4VfTQKrGakcdVApd9iJsRMtpnXhnnfo=; b=l1faSoXv/Q2ZtaLeYL61ALwqyd
	asD1oucevyUk++kfQLU2A+lfIkKzRgAHDxLVvkNS4vGKPA7thGiI0HGHlGPrJFefdOT2Y69Ppmg2r
	Gz42a8qSEWVhp5BJTEytKl73M7FVzh6tgMp9mt2E962qrJBspr8OlfBHR86T3h8G41u0g/XrISolr
	smYb2Kn/2RMJcFjiBXqEQiwyxQd7x94noJmTDrvjrrujJrTvTVGOLVIh6RYegMHAd/GbrG1hnlqA9
	2K5CqhOgHdVcm7btjb5BKAPw/iWW8vfJ8CXkzow0RK1BxPe2EtapuyXw/odIxOe/GsHQRJaGJj4wS
	GUUz789w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4cIZ-0005hs-5r; Tue, 25 Sep 2018 01:37:59 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g43qr-0002wH-SS
 for linux-riscv@lists.infradead.org; Sun, 23 Sep 2018 12:51:11 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id F009340024
 for <linux-riscv@lists.infradead.org>; Sun, 23 Sep 2018 14:49:53 +0200 (CEST)
Received: from armitage.lysator.liu.se (armitage.lysator.liu.se
 [IPv6:2001:6b0:17:f0a0::83])
 by mail.lysator.liu.se (Postfix) with SMTP id D43694001C
 for <linux-riscv@lists.infradead.org>; Sun, 23 Sep 2018 14:49:52 +0200 (CEST)
Received: by armitage.lysator.liu.se (sSMTP sendmail emulation);
 Sun, 23 Sep 2018 14:49:52 +0200
From: Marcus Comstedt <marcus@lysator.liu.se>
To: linux-riscv@lists.infradead.org
Subject: mmcqd/0 stuck at 100% CPU
Date: Sun, 23 Sep 2018 14:49:52 +0200
Message-ID: <q3worc5qfj.fsf@armitage.lysator.liu.se>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (berkeley-unix)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180923_055106_618583_6B516544 
X-CRM114-Status: GOOD (  15.56  )
X-Mailman-Approved-At: Mon, 24 Sep 2018 18:37:38 -0700
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180923124952.rphjEUS889h8e7V95hUeAgZUweeYVRKv_2eJNh7Er3c@z>

--=-=-=
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


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
(rw,noatime,discard,data=3Dordered).

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
#=20

Also, I've attached the output from sysrq-t.

There are no errors printed to dmesg, and as long as writes to the sdcard
are avoided, the system can be used normally.

Perhaps also of interrest is the contents of
/sys/class/block/mmcblk0/stat.  Two snapshots taken 10 minutes apart:

   10251     5098   254209   223400     6874    30872   371741 30496260   2=
 39464030 109152380
   10251     5098   254209   223400     6874    30872   371741 30496260   2=
 40108480 110441280

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


--=20
--------------------------------------------------------------------------
Marcus Comstedt                          Lysator Academic Computer Society
marcus@lysator.liu.se                    Link=F6ping University, Sweden   //
----------------------------------------------------------------------\X/-


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=h5u-sysreq-t.txt

[140545.897294] sysrq: SysRq : Show State
[140545.900267]   task                        PC stack   pid father
[140545.906268] init            S    0     1      0 0x00000000
[140545.911813] Call Trace:
[140545.914355] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140545.919632] [<000000007ea0b92f>] schedule+0x16/0x58
[140545.924589] [<00000000ccaef36f>] schedule_hrtimeout_range_clock+0x6e/0xc2
[140545.931439] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140545.937698] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140545.943772] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140545.948978] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140545.954719] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140545.960178] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140545.965823] kthreadd        S    0     2      0 0x00000000
[140545.971372] Call Trace:
[140545.973901] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140545.979192] [<000000007ea0b92f>] schedule+0x16/0x58
[140545.984145] [<000000007d42803f>] kthreadd+0xee/0xfc
[140545.989088] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140545.994561] kworker/1:0H    I    0     4      2 0x00000000
[140546.000115] Call Trace:
[140546.002634] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.007934] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.012881] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140546.018356] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.023214] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.028676] mm_percpu_wq    I    0     6      2 0x00000000
[140546.034238] Call Trace:
[140546.036755] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.042050] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.047004] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.052643] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.057508] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.062970] ksoftirqd/1     S    0     7      2 0x00000000
[140546.068530] Call Trace:
[140546.071049] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.076349] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.081300] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.087203] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.092058] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.097530] rcu_sched       I    0     8      2 0x00000000
[140546.103080] Call Trace:
[140546.105609] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.110900] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.115858] [<000000005daa62c2>] rcu_gp_kthread+0x4f8/0x6cc
[140546.121493] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.126358] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.131820] rcu_bh          I    0     9      2 0x00000000
[140546.137380] Call Trace:
[140546.139899] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.145199] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.150143] [<000000005daa62c2>] rcu_gp_kthread+0x4f8/0x6cc
[140546.155798] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.160647] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.166120] migration/1     S    0    10      2 0x00000000
[140546.171670] Call Trace:
[140546.174198] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.179489] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.184444] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.190342] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.195207] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.200670] cpuhp/1         S    0    11      2 0x00000000
[140546.206229] Call Trace:
[140546.208748] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.214049] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.218993] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.224901] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.229758] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.235229] cpuhp/2         S    0    12      2 0x00000000
[140546.240780] Call Trace:
[140546.243308] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.248599] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.253553] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.259452] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.264318] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.269780] migration/2     S    0    13      2 0x00000000
[140546.275339] Call Trace:
[140546.277858] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.283159] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.288103] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.294011] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.298867] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.304339] ksoftirqd/2     S    0    14      2 0x00000000
[140546.309889] Call Trace:
[140546.312413] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.317714] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.322658] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.328567] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.333427] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.338889] kworker/2:0H    I    0    16      2 0x00000000
[140546.344452] Call Trace:
[140546.346968] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.352264] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.357217] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140546.362682] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.367548] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.373010] cpuhp/3         S    0    17      2 0x00000000
[140546.378570] Call Trace:
[140546.381089] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.386389] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.391334] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.397242] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.402098] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.407570] migration/3     S    0    18      2 0x00000000
[140546.413120] Call Trace:
[140546.415654] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.420940] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.425894] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.431793] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.436658] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.442121] ksoftirqd/3     S    0    19      2 0x00000000
[140546.447680] Call Trace:
[140546.450199] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.455499] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.460444] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.466352] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.471209] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.476680] kworker/3:0H    I    0    21      2 0x00000000
[140546.482233] Call Trace:
[140546.484759] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.490050] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.495003] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140546.500469] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.505334] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.510796] cpuhp/4         S    0    22      2 0x00000000
[140546.516356] Call Trace:
[140546.518875] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.524175] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.529120] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.535028] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.539884] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.545356] migration/4     S    0    23      2 0x00000000
[140546.550906] Call Trace:
[140546.553435] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.558726] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.563680] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.569579] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.574444] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.579906] ksoftirqd/4     S    0    24      2 0x00000000
[140546.585466] Call Trace:
[140546.587985] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.593285] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.598230] [<00000000c8b189eb>] smpboot_thread_fn+0x10c/0x112
[140546.604138] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.608994] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.614466] kworker/4:0H    I    0    26      2 0x00000000
[140546.620019] Call Trace:
[140546.622541] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.627840] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.632784] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140546.638259] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.643115] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.648587] kdevtmpfs       S    0    27      2 0x00000000
[140546.654142] Call Trace:
[140546.656661] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.661957] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.666914] [<00000000062968c3>] devtmpfsd+0x134/0x13a
[140546.672115] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.676985] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.682442] netns           I    0    28      2 0x00000000
[140546.688004] Call Trace:
[140546.690522] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.695822] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.700765] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.706414] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.711270] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.716741] kworker/1:1     I    0    29      2 0x00000000
[140546.722294] Call Trace:
[140546.724820] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.730111] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.735064] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140546.740530] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.745396] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.750858] oom_reaper      S    0    30      2 0x00000000
[140546.756417] Call Trace:
[140546.758937] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.764237] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.769183] [<00000000b790ea44>] oom_reaper+0xdc/0x114
[140546.774396] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.779252] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.784723] writeback       I    0    31      2 0x00000000
[140546.790276] Call Trace:
[140546.792797] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.798098] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.803041] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.808690] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.813551] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.819013] crypto          I    0    32      2 0x00000000
[140546.824575] Call Trace:
[140546.827092] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.832387] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.837340] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.842980] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.847845] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.853312] kblockd         I    0    33      2 0x00000000
[140546.858865] Call Trace:
[140546.861386] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.866687] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.871630] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.877279] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.882135] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.887606] ata_sff         I    0    34      2 0x00000000
[140546.893164] Call Trace:
[140546.895681] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.900977] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.905929] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.911569] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.916434] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.921896] rpciod          I    0    35      2 0x00000000
[140546.927458] Call Trace:
[140546.929976] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.935281] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.940220] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.945868] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.950724] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.956196] xprtiod         I    0    36      2 0x00000000
[140546.961748] Call Trace:
[140546.964275] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140546.969566] [<000000007ea0b92f>] schedule+0x16/0x58
[140546.974519] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140546.980158] [<00000000ff9ac813>] kthread+0xcc/0xde
[140546.985023] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140546.990486] kswapd0         S    0    37      2 0x00000000
[140546.996045] Call Trace:
[140546.998565] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.003865] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.008810] [<00000000e217e215>] kswapd+0x420/0x474
[140547.013762] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.018618] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.024090] nfsiod          I    0    38      2 0x00000000
[140547.029643] Call Trace:
[140547.032165] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.037465] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.042408] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140547.048057] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.052913] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.058384] kworker/3:1     I    0    64      2 0x00000000
[140547.063941] Call Trace:
[140547.066459] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.071754] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.076707] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.082173] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.087039] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.092501] spi0            S    0    65      2 0x00000000
[140547.098061] Call Trace:
[140547.100580] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.105880] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.110825] [<000000001ff772d6>] kthread_worker_fn+0x94/0xca
[140547.116559] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.121415] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.126887] spi1            S    0    68      2 0x00000000
[140547.132437] Call Trace:
[140547.134966] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.140257] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.145210] [<000000001ff772d6>] kthread_worker_fn+0x94/0xca
[140547.150936] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.155801] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.161264] spi2            S    0    69      2 0x00000000
[140547.166823] Call Trace:
[140547.169342] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.174643] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.179587] [<000000001ff772d6>] kthread_worker_fn+0x94/0xca
[140547.185322] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.190178] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.195654] irq/48-spi2.0 c S    0    71      2 0x00000000
[140547.201200] Call Trace:
[140547.203729] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.209019] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.213976] [<000000009888e65d>] irq_thread+0x7e/0x17a
[140547.219178] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.224043] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.229506] ipv6_addrconf   I    0    72      2 0x00000000
[140547.235067] Call Trace:
[140547.237584] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.242880] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.247833] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140547.253477] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.258333] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.263804] mmcqd/0         R    0    74      2 0x00000000
[140547.269355] Call Trace:
[140547.271879] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.277184] [<00000000fe07a63e>] blk_fetch_request+0x12/0x56
[140547.282907] [<00000000700964d9>] mmc_queue_thread+0x56/0xf6
[140547.288553] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.293414] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.298876] kworker/4:1H    I    0    75      2 0x00000000
[140547.304438] Call Trace:
[140547.306955] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.312250] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.317203] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.322669] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.327534] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.332997] kworker/2:1     I    0    76      2 0x00000000
[140547.338558] Call Trace:
[140547.341076] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.346376] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.351319] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.356794] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.361651] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.367122] kworker/4:1     I    0    77      2 0x00000000
[140547.372675] Call Trace:
[140547.375201] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.380492] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.385445] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.390911] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.395776] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.401239] jbd2/mmcblk0p2- D    0    78      2 0x00000000
[140547.406798] Call Trace:
[140547.409317] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.414618] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.419564] [<0000000051eed689>] io_schedule+0x14/0x38
[140547.424775] [<000000002451f49b>] wait_on_page_bit+0xce/0xfe
[140547.430414] [<00000000676c4fff>] __filemap_fdatawait_range+0x86/0xce
[140547.436843] [<00000000b91d392c>] filemap_fdatawait_keep_errors+0x12/0x36
[140547.443618] [<000000006ff1cf29>] jbd2_journal_commit_transaction+0x544/0x1220
[140547.450819] [<00000000a04ad3c4>] kjournald2+0x92/0x17a
[140547.456037] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.460888] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.466360] ext4-rsv-conver I    0    79      2 0x00000000
[140547.471912] Call Trace:
[140547.474439] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.479729] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.484683] [<000000002c2b1738>] rescuer_thread+0x1d2/0x2ca
[140547.490322] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.495187] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.500650] kworker/1:1H    I    0    80      2 0x00000000
[140547.506211] Call Trace:
[140547.508728] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.514029] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.518972] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.524447] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.529303] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.534775] kworker/3:1H    I    0    84      2 0x00000000
[140547.540328] Call Trace:
[140547.542849] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.548149] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.553093] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.558568] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.563429] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.568891] kworker/2:1H    I    0   183      2 0x00000000
[140547.574453] Call Trace:
[140547.576970] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.582265] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.587219] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140547.592684] [<00000000ff9ac813>] kthread+0xcc/0xde
[140547.597550] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140547.603012] udevd           S    0   623      1 0x00000000
[140547.608571] Call Trace:
[140547.611091] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.616391] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.621335] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140547.628198] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.634457] [<000000000e30b5d7>] ep_poll+0x1f4/0x27c
[140547.639480] [<00000000d66b5742>] SyS_epoll_wait+0x90/0xa0
[140547.644954] [<00000000f6b91c37>] SyS_epoll_pwait+0x7a/0xf0
[140547.650506] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.656151] dhcpcd          S    0  1459      1 0x00000000
[140547.661702] Call Trace:
[140547.664230] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.669521] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.674474] [<00000000ccaef36f>] schedule_hrtimeout_range_clock+0x6e/0xc2
[140547.681328] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.687585] [<000000000e30b5d7>] ep_poll+0x1f4/0x27c
[140547.692614] [<00000000d66b5742>] SyS_epoll_wait+0x90/0xa0
[140547.698089] [<00000000585da1b7>] SyS_epoll_pwait+0x4c/0xf0
[140547.703646] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.709282] rpcbind         S    0  1579      1 0x00000000
[140547.714846] Call Trace:
[140547.717360] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.722656] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.727610] [<00000000ccaef36f>] schedule_hrtimeout_range_clock+0x6e/0xc2
[140547.734468] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.740715] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140547.746796] [<00000000bcea6bef>] do_sys_poll+0x1fa/0x384
[140547.752175] [<00000000b0f942ba>] SyS_ppoll+0x112/0x14c
[140547.757388] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.763024] ypbind          S    0  1607      1 0x00000000
[140547.768584] Call Trace:
[140547.771103] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.776403] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.781347] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140547.788211] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.794461] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140547.800534] [<00000000bcea6bef>] do_sys_poll+0x1fa/0x384
[140547.805922] [<00000000b0f942ba>] SyS_ppoll+0x112/0x14c
[140547.811126] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.816771] ypbind          S    0  1608      1 0x00000000
[140547.822322] Call Trace:
[140547.824850] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.830141] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.835094] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140547.841948] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.848211] [<00000000387d48c9>] SyS_rt_sigtimedwait+0x162/0x1c6
[140547.854281] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.859917] ypbind          S    0  1610      1 0x00000000
[140547.865476] Call Trace:
[140547.867996] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.873296] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.878239] [<00000000d9ad991f>] do_nanosleep+0x40/0xd0
[140547.883547] [<000000005b3a2a2d>] hrtimer_nanosleep+0xaa/0x122
[140547.889354] [<00000000053bf16d>] SyS_nanosleep+0x44/0x5a
[140547.894740] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.900376] rpc.statd       S    0  1638      1 0x00000000
[140547.905935] Call Trace:
[140547.908455] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.913755] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.918699] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140547.925562] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.931809] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140547.937890] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140547.943095] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140547.948830] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140547.954300] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140547.959936] rpc.idmapd      S    0  1692      1 0x00000000
[140547.965495] Call Trace:
[140547.968015] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140547.973319] [<000000007ea0b92f>] schedule+0x16/0x58
[140547.978258] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140547.985123] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140547.991370] [<000000000e30b5d7>] ep_poll+0x1f4/0x27c
[140547.996408] [<00000000d66b5742>] SyS_epoll_wait+0x90/0xa0
[140548.001873] [<00000000f6b91c37>] SyS_epoll_pwait+0x7a/0xf0
[140548.007435] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.013071] NFSv4 callback  S    0  1746      2 0x00000000
[140548.018630] Call Trace:
[140548.021149] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.026450] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.031393] [<000000006d05a156>] schedule_timeout+0x112/0x13c
[140548.037218] [<00000000e888463d>] svc_recv+0x398/0x600
[140548.042335] [<000000007b775f81>] nfs4_callback_svc+0x38/0x7c
[140548.048069] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.052924] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.058396] kworker/4:2     I    0  1750      2 0x00000000
[140548.063953] Call Trace:
[140548.066471] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.071766] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.076719] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140548.082184] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.087050] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.092512] ntpd            S    0  1779      1 0x00000000
[140548.098072] Call Trace:
[140548.100591] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.105891] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.110835] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140548.117698] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140548.123950] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140548.130022] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140548.135236] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140548.140962] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140548.146436] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.152072] sshd            S    0  1809      1 0x00000000
[140548.157631] Call Trace:
[140548.160151] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.165451] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.170395] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140548.177258] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140548.183509] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140548.189582] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140548.194796] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140548.200521] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140548.205996] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.211631] cron            S    0  1836      1 0x00000000
[140548.217191] Call Trace:
[140548.219710] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.225011] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.229954] [<00000000d9ad991f>] do_nanosleep+0x40/0xd0
[140548.235262] [<000000005b3a2a2d>] hrtimer_nanosleep+0xaa/0x122
[140548.241068] [<00000000053bf16d>] SyS_nanosleep+0x44/0x5a
[140548.246455] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.252091] agetty          S    0  1867      1 0x00000000
[140548.257650] Call Trace:
[140548.260169] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.265470] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.270413] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140548.277277] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140548.283528] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140548.289600] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140548.294814] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140548.300540] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140548.306014] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.311650] sshd            S    0  1868   1809 0x00000000
[140548.317210] Call Trace:
[140548.319729] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.325029] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.329973] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140548.336836] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140548.343083] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140548.349164] [<00000000bcea6bef>] do_sys_poll+0x1fa/0x384
[140548.354548] [<00000000b0f942ba>] SyS_ppoll+0x112/0x14c
[140548.359752] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.365397] sshd            S    0  1870   1868 0x00000000
[140548.370948] Call Trace:
[140548.373476] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.378767] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.383720] [<0000000094cb1be5>] schedule_hrtimeout_range_clock+0xba/0xc2
[140548.390574] [<00000000f69a2e0b>] schedule_hrtimeout_range+0xa/0x16
[140548.396830] [<00000000019272d7>] poll_schedule_timeout+0x22/0x40
[140548.402902] [<000000004f6a18be>] do_select+0x4ca/0x55a
[140548.408116] [<000000000cb49b72>] core_sys_select+0x120/0x1c6
[140548.413846] [<000000008233eb17>] SyS_pselect6+0x18a/0x1a4
[140548.419312] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.424957] tcsh            S    0  1871   1870 0x00000000
[140548.430507] Call Trace:
[140548.433031] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.438331] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.443281] [<0000000095aa0f72>] SyS_rt_sigsuspend+0x60/0xb6
[140548.449005] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.454650] kworker/u8:1    D    0 31440      2 0x00000000
[140548.460208] Workqueue: writeback wb_workfn (flush-179:0)
[140548.465588] Call Trace:
[140548.468107] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.473407] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.478351] [<0000000051eed689>] io_schedule+0x14/0x38
[140548.483564] [<00000000ab8a4823>] __lock_page+0xc2/0xee
[140548.488775] [<000000003b30ff32>] mpage_prepare_extent_to_map+0x1ce/0x204
[140548.495553] [<0000000095ec5221>] ext4_writepages+0x202/0x958
[140548.501277] [<00000000dc87c626>] do_writepages+0x34/0xa8
[140548.506661] [<0000000091bb31e3>] __writeback_single_inode+0x2a/0x162
[140548.513080] [<0000000031607f3f>] writeback_sb_inodes+0x17e/0x300
[140548.519161] [<000000002cb0770d>] __writeback_inodes_wb+0x4c/0x96
[140548.525239] [<00000000d61a1560>] wb_writeback+0x172/0x17a
[140548.530704] [<000000008cda96db>] wb_workfn+0x134/0x24c
[140548.535919] [<00000000dd453c03>] process_one_work+0x150/0x2d8
[140548.541731] [<00000000d18d6638>] worker_thread+0x54/0x436
[140548.547206] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.552062] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.557534] kworker/2:0     I    0 18438      2 0x00000000
[140548.563086] Call Trace:
[140548.565613] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.570903] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.575856] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140548.581322] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.586187] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.591650] kworker/u8:0    I    0 11398      2 0x00000000
[140548.597211] Call Trace:
[140548.599728] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.605029] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.609972] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140548.615447] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.620304] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.625775] cron            S    0 13107   1836 0x00000000
[140548.631325] Call Trace:
[140548.633854] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.639145] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.644102] [<00000000b59486e3>] pipe_wait+0x46/0x7a
[140548.649129] [<0000000010ab69b9>] pipe_read+0x198/0x21e
[140548.654348] [<00000000e9ea50a3>] __vfs_read+0xac/0xe4
[140548.659461] [<00000000e925520b>] vfs_read+0x5e/0xd6
[140548.664415] [<00000000c8657889>] SyS_read+0x38/0x80
[140548.669358] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.675003] run-crons       S    0 13108  13107 0x00000000
[140548.680553] Call Trace:
[140548.683078] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.688377] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.693331] [<0000000086c518de>] do_wait+0x146/0x156
[140548.698358] [<0000000026d78434>] kernel_wait4+0x5c/0xd8
[140548.703658] [<00000000974aa18d>] SyS_wait4+0x30/0x5c
[140548.708688] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.714333] mandb           D    0 13118  13108 0x00000000
[140548.719883] Call Trace:
[140548.722408] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.727708] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.732651] [<0000000051eed689>] io_schedule+0x14/0x38
[140548.737865] [<000000002451f49b>] wait_on_page_bit+0xce/0xfe
[140548.743510] [<00000000e93e345f>] mpage_prepare_extent_to_map+0x166/0x204
[140548.750277] [<0000000095ec5221>] ext4_writepages+0x202/0x958
[140548.756018] [<00000000dc87c626>] do_writepages+0x34/0xa8
[140548.761389] [<0000000024d6cb2c>] __filemap_fdatawrite_range+0x54/0x6a
[140548.767906] [<00000000c8793e7d>] file_write_and_wait_range+0x26/0x68
[140548.774330] [<0000000079424488>] ext4_sync_file+0x70/0x240
[140548.779885] [<000000006a1bf4d4>] vfs_fsync_range+0x2e/0x86
[140548.785444] [<0000000011028a66>] SyS_msync+0x116/0x15a
[140548.790648] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.796293] nullmailer-inje S    0 13119  13107 0x00000000
[140548.801843] Call Trace:
[140548.804372] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.809663] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.814616] [<00000000b59486e3>] pipe_wait+0x46/0x7a
[140548.819647] [<0000000010ab69b9>] pipe_read+0x198/0x21e
[140548.824862] [<00000000e9ea50a3>] __vfs_read+0xac/0xe4
[140548.829979] [<00000000e925520b>] vfs_read+0x5e/0xd6
[140548.834932] [<00000000c8657889>] SyS_read+0x38/0x80
[140548.839875] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.845521] kworker/3:2     I    0 28213      2 0x00000000
[140548.851073] Call Trace:
[140548.853600] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.858890] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.863844] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140548.869310] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.874175] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.879637] kworker/u8:3    I    0 28237      2 0x00000000
[140548.885199] Call Trace:
[140548.887716] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140548.893011] [<000000007ea0b92f>] schedule+0x16/0x58
[140548.897964] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140548.903434] [<00000000ff9ac813>] kthread+0xcc/0xde
[140548.908291] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140548.913762] bash            R  running task        0 28288   1871 0x00000008
[140548.920875] Call Trace:
[140548.923404] [<000000006a55e982>] walk_stackframe+0x0/0xa2
[140548.928868] [<00000000794a8762>] show_stack+0x26/0x34
[140548.933995] [<000000001aa92f44>] sched_show_task+0xa6/0xfc
[140548.939547] [<00000000056650ca>] show_state_filter+0x54/0xa4
[140548.945282] [<000000007b94923e>] sysrq_handle_showstate+0xe/0x22
[140548.951355] [<000000004a9dde73>] __handle_sysrq+0x9c/0x17c
[140548.956916] [<00000000ecbbe18e>] write_sysrq_trigger+0x34/0x50
[140548.962816] [<0000000013606596>] proc_reg_write+0x38/0x82
[140548.968291] [<0000000062f6bb53>] __vfs_write+0x14/0xe8
[140548.973500] [<0000000010bf98f1>] vfs_write+0x72/0x10a
[140548.978617] [<000000004f7588b3>] SyS_write+0x38/0x80
[140548.983656] [<0000000018f3779e>] check_syscall_nr+0x1e/0x22
[140548.989293] kworker/1:2     I    0 28353      2 0x00000000
[140548.994854] Call Trace:
[140548.997372] [<00000000a3d6c938>] __schedule+0x1c6/0x4ea
[140549.002667] [<000000007ea0b92f>] schedule+0x16/0x58
[140549.007620] [<000000009d6b2ad5>] worker_thread+0xb4/0x436
[140549.013086] [<00000000ff9ac813>] kthread+0xcc/0xde
[140549.017956] [<00000000d917143e>] ret_from_syscall+0xa/0xe
[140549.023420] Sched Debug Version: v0.11, 4.15.18+ #4
[140549.028363] ktime                                   : 140549030.281338
[140549.034966] sched_clk                               : 140549023.416000
[140549.041560] cpu_clk                                 : 140549023.416000
[140549.048162] jiffies                                 : 4308992201
[140549.054238] 
[140549.055796] sysctl_sched
[140549.058403]   .sysctl_sched_latency                    : 18.000000
[140549.064659]   .sysctl_sched_min_granularity            : 2.250000
[140549.070818]   .sysctl_sched_wakeup_granularity         : 3.000000
[140549.076987]   .sysctl_sched_child_runs_first           : 0
[140549.082539]   .sysctl_sched_features                   : 2021179
[140549.088622]   .sysctl_sched_tunable_scaling            : 1 (logaritmic)
[140549.095304] 
[140549.096864] cpu#1
[140549.098861]   .nr_running                    : 0
[140549.103553]   .load                          : 0
[140549.108238]   .nr_switches                   : 8775081
[140549.113452]   .nr_load_updates               : 14054912
[140549.118743]   .nr_uninterruptible            : 14
[140549.123524]   .next_balance                  : 4308.992210
[140549.129075]   .curr->pid                     : 0
[140549.133769]   .clock                         : 140549133.138000
[140549.139755]   .clock_task                    : 140549133.138000
[140549.145749]   .cpu_load[0]                   : 0
[140549.150433]   .cpu_load[1]                   : 0
[140549.155125]   .cpu_load[2]                   : 0
[140549.159810]   .cpu_load[3]                   : 0
[140549.164502]   .cpu_load[4]                   : 0
[140549.169186]   .avg_idle                      : 1000000
[140549.174400]   .max_idle_balance_cost         : 500000
[140549.179518] 
[140549.179518] cfs_rq[1]:
[140549.183513]   .exec_clock                    : 0.000000
[140549.188809]   .MIN_vruntime                  : 0.000001
[140549.194105]   .min_vruntime                  : 4047864.213407
[140549.199922]   .max_vruntime                  : 0.000001
[140549.205218]   .spread                        : 0.000000
[140549.210514]   .spread0                       : 4047864.213407
[140549.216330]   .nr_spread_over                : 0
[140549.221019]   .nr_running                    : 0
[140549.225707]   .load                          : 0
[140549.230395]   .runnable_weight               : 0
[140549.235084]   .load_avg                      : 0
[140549.239772]   .runnable_load_avg             : 0
[140549.244461]   .util_avg                      : 0
[140549.249149]   .removed.load_avg              : 0
[140549.253837]   .removed.util_avg              : 0
[140549.258526]   .removed.runnable_sum          : 0
[140549.263214] 
[140549.263214] rt_rq[1]:
[140549.267121]   .rt_nr_running                 : 0
[140549.271809]   .rt_nr_migratory               : 0
[140549.276498]   .rt_throttled                  : 0
[140549.281187]   .rt_time                       : 0.000000
[140549.286483]   .rt_runtime                    : 950.000000
[140549.291952] 
[140549.291952] dl_rq[1]:
[140549.295859]   .dl_nr_running                 : 0
[140549.300548]   .dl_nr_migratory               : 0
[140549.305236]   .dl_bw->bw                     : 996147
[140549.310358]   .dl_bw->total_bw               : 0
[140549.315050] 
[140549.315050] runnable tasks:
[140549.315050]  S           task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[140549.315050] -----------------------------------------------------------------------------------------------------------
[140549.341266]  S
[140549.341273]            init     1   4047855.266407     28963   120 
[140549.343005]         0.000000      1442.470000         0.000000
[140549.349340] 
[140549.356807]  S
[140549.356813]        kthreadd     2   4047578.390512        96   120 
[140549.358546]         0.000000         6.393000         0.000000
[140549.364881] 
[140549.372348]  I
[140549.372354]    kworker/1:0H     4       541.160518         6   100 
[140549.374087]         0.000000         0.063000         0.000000
[140549.380423] 
[140549.387889]  I
[140549.387895]    mm_percpu_wq     6        13.568096         2   100 
[140549.389629]         0.000000         0.009000         0.000000
[140549.395964] 
[140549.403430]  S
[140549.403436]     ksoftirqd/1     7   4047683.281472      5457   120 
[140549.405170]         0.000000       271.106000         0.000000
[140549.411505] 
[140549.418971]  I
[140549.418977]          rcu_bh     9        17.585071         2   120 
[140549.420710]         0.000000         0.007000         0.000000
[140549.427046] 
[140549.434512]  S
[140549.434518]     migration/1    10         0.000000      5029     0 
[140549.436252]         0.000000       110.522000         0.000000
[140549.442587] 
[140549.450053]  S
[140549.450059]         cpuhp/1    11       295.459009         5   120 
[140549.451793]         0.000000         0.161000         0.000000
[140549.458128] 
[140549.465597]  S
[140549.465603]       kdevtmpfs    27       456.482999       543   120 
[140549.467334]         0.000000         8.625000         0.000000
[140549.473669] 
[140549.481135]  I
[140549.481142]     kworker/1:1    29   4047855.568407    686563   120 
[140549.482875]         0.000000      5915.395000         0.000000
[140549.489210] 
[140549.496677]  I
[140549.496683]          rpciod    35       286.170055         2   100 
[140549.498416]         0.000000         0.035000         0.000000
[140549.504751] 
[140549.512219]  D
[140549.512225] jbd2/mmcblk0p2-    78   4027131.971280      4167   120 
[140549.513957]         0.000000       345.858000         0.000000
[140549.520292] 
[140549.527758]  I
[140549.527764] ext4-rsv-conver    79       525.539023         2   100 
[140549.529498]         0.000000         0.016000         0.000000
[140549.535833] 
[140549.543299]  I
[140549.543306]    kworker/1:1H    80   4047732.693814      1113   100 
[140549.545039]         0.000000        20.504000         0.000000
[140549.551375] 
[140549.558842]  S
[140549.558848]       rpc.statd  1638      8736.244634        21   120 
[140549.560580]         0.000000        14.006000         0.000000
[140549.566915] 
[140549.574384]  S
[140549.574390]            cron 13107   3691319.955074         4   120 
[140549.576121]         0.000000         0.622000         0.000000
[140549.582456] 
[140549.589924]  I
[140549.589930]     kworker/1:2 28353   4047587.344512         3   120 
[140549.591662]         0.000000         0.019000         0.000000
[140549.597997] 
[140549.605572] 
[140549.607027] cpu#2
[140549.609025]   .nr_running                    : 0
[140549.613718]   .load                          : 0
[140549.618402]   .nr_switches                   : 2076439
[140549.623615]   .nr_load_updates               : 14054958
[140549.628907]   .nr_uninterruptible            : 9
[140549.633600]   .next_balance                  : 4308.992261
[140549.639151]   .curr->pid                     : 0
[140549.643845]   .clock                         : 140549643.137000
[140549.649832]   .clock_task                    : 140549643.137000
[140549.655826]   .cpu_load[0]                   : 0
[140549.660509]   .cpu_load[1]                   : 0
[140549.665202]   .cpu_load[2]                   : 0
[140549.669886]   .cpu_load[3]                   : 0
[140549.674579]   .cpu_load[4]                   : 0
[140549.679263]   .avg_idle                      : 1000000
[140549.684477]   .max_idle_balance_cost         : 500000
[140549.689594] 
[140549.689594] cfs_rq[2]:
[140549.693589]   .exec_clock                    : 0.000000
[140549.698886]   .MIN_vruntime                  : 0.000001
[140549.704182]   .min_vruntime                  : 5307987.338467
[140549.709999]   .max_vruntime                  : 0.000001
[140549.715295]   .spread                        : 0.000000
[140549.720591]   .spread0                       : 5307987.338467
[140549.726407]   .nr_spread_over                : 0
[140549.731095]   .nr_running                    : 0
[140549.735784]   .load                          : 0
[140549.740472]   .runnable_weight               : 0
[140549.745161]   .load_avg                      : 0
[140549.749849]   .runnable_load_avg             : 0
[140549.754537]   .util_avg                      : 0
[140549.759226]   .removed.load_avg              : 0
[140549.763914]   .removed.util_avg              : 0
[140549.768602]   .removed.runnable_sum          : 0
[140549.773290] 
[140549.773290] rt_rq[2]:
[140549.777198]   .rt_nr_running                 : 0
[140549.781886]   .rt_nr_migratory               : 0
[140549.786575]   .rt_throttled                  : 0
[140549.791264]   .rt_time                       : 0.000000
[140549.796560]   .rt_runtime                    : 950.000000
[140549.802028] 
[140549.802028] dl_rq[2]:
[140549.805936]   .dl_nr_running                 : 0
[140549.810624]   .dl_nr_migratory               : 0
[140549.815313]   .dl_bw->bw                     : 996147
[140549.820435]   .dl_bw->total_bw               : 0
[140549.825126] 
[140549.825126] runnable tasks:
[140549.825126]  S           task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[140549.825126] -----------------------------------------------------------------------------------------------------------
[140549.851344]  S
[140549.851350]         cpuhp/2    12        14.203492         5   120 
[140549.853082]         0.000000         0.224000         0.000000
[140549.859417] 
[140549.866883]  S
[140549.866889]     migration/2    13         0.000000      6237     0 
[140549.868623]         0.000000       130.109000         0.000000
[140549.874959] 
[140549.882424]  S
[140549.882430]     ksoftirqd/2    14   5307622.529569      3284   120 
[140549.884164]         0.000000       213.829000         0.000000
[140549.890499] 
[140549.897965]  I
[140549.897972]    kworker/2:0H    16       552.093934         7   100 
[140549.899705]         0.000000         0.097000         0.000000
[140549.906040] 
[140549.913508]  S
[140549.913514]      oom_reaper    30         4.986422         2   120 
[140549.915246]         0.000000         0.035000         0.000000
[140549.921581] 
[140549.929048]  I
[140549.929054]       writeback    31        13.999440         2   100 
[140549.930787]         0.000000         0.015000         0.000000
[140549.937122] 
[140549.944589]  I
[140549.944595]         ata_sff    34        14.005463         2   100 
[140549.946329]         0.000000         0.018000         0.000000
[140549.952664] 
[140549.960130]  I
[140549.960136]          nfsiod    38        23.016492         2   100 
[140549.961869]         0.000000         0.014000         0.000000
[140549.968205] 
[140549.975671]  S
[140549.975677]            spi1    68        32.028487         2   120 
[140549.977411]         0.000000         0.012000         0.000000
[140549.983746] 
[140549.991213]  I
[140549.991219]     kworker/2:1    76   5307979.852467    146534   120 
[140549.992952]         0.000000     33188.647000         0.000000
[140549.999287] 
[140550.006754]  I
[140550.006760]    kworker/2:1H   183   5307734.081902      1543   100 
[140550.008493]         0.000000        28.889000         0.000000
[140550.014828] 
[140550.022294]  S
[140550.022301]           udevd   623     11563.851420      1117   120 
[140550.024034]         0.000000       195.310000         0.000000
[140550.030369] 
[140550.037836]  S
[140550.037842]          ypbind  1608     10206.401682         1   120 
[140550.039575]         0.000000         0.138000         0.000000
[140550.045910] 
[140550.053376]  S
[140550.053382]          ypbind  1610   5307887.281497      1407   120 
[140550.055116]         0.000000       202.092000         0.000000
[140550.061451] 
[140550.068917]  S
[140550.068924]      rpc.idmapd  1692     11153.359487        16   120 
[140550.070657]         0.000000         6.666000         0.000000
[140550.076992] 
[140550.084458]  S
[140550.084464]  NFSv4 callback  1746     11888.538350         6   120 
[140550.086198]         0.000000         0.286000         0.000000
[140550.092533] 
[140550.100000]  S
[140550.100006]            ntpd  1779   5307978.500467    140916   120 
[140550.101739]         0.000000      4397.179000         0.000000
[140550.108074] 
[140550.115540]  S
[140550.115546]            sshd  1809     11688.798405         4   120 
[140550.117280]         0.000000         2.130000         0.000000
[140550.123616] 
[140550.131082]  S
[140550.131088]            cron  1836   5307903.693497      2903   120 
[140550.132822]         0.000000       358.899000         0.000000
[140550.139156] 
[140550.146622]  S
[140550.146629]          agetty  1867   5307906.355497        57   120 
[140550.148362]         0.000000         9.643000         0.000000
[140550.154698] 
[140550.162164]  S
[140550.162170]            tcsh  1871   5307190.326654       554   120 
[140550.163903]         0.000000       204.913000         0.000000
[140550.170239] 
[140550.177705]  I
[140550.177711]     kworker/2:0 18438   2868162.653683         2   120 
[140550.179445]         0.000000         0.007000         0.000000
[140550.185780] 
[140550.193246]  I
[140550.193252]    kworker/u8:0 11398   5307399.507604       372   120 
[140550.194985]         0.000000         9.443000         0.000000
[140550.201321] 
[140550.208787]  S
[140550.208793]       run-crons 13108   4936832.326904        15   120 
[140550.210527]         0.000000        25.551000         0.000000
[140550.216862] 
[140550.224328]  D
[140550.224334]           mandb 13118   5284673.557766     14154   130 
[140550.226068]         0.000000     10366.174000         0.000000
[140550.232403] 
[140550.240005] 
[140550.241432] cpu#3
[140550.243435]   .nr_running                    : 1
[140550.248119]   .load                          : 1048576
[140550.253332]   .nr_switches                   : 4887520
[140550.258537]   .nr_load_updates               : 14055019
[140550.263838]   .nr_uninterruptible            : -4
[140550.268609]   .next_balance                  : 4308.992346
[140550.274169]   .curr->pid                     : 28288
[140550.279202]   .clock                         : 140550274.164000
[140550.285197]   .clock_task                    : 140550285.190000
[140550.291182]   .cpu_load[0]                   : 1023
[140550.296135]   .cpu_load[1]                   : 1023
[140550.301080]   .cpu_load[2]                   : 1023
[140550.306033]   .cpu_load[3]                   : 1023
[140550.310977]   .cpu_load[4]                   : 1023
[140550.315931]   .avg_idle                      : 1000000
[140550.321136]   .max_idle_balance_cost         : 500000
[140550.326262] 
[140550.326262] cfs_rq[3]:
[140550.330252]   .exec_clock                    : 0.000000
[140550.335548]   .MIN_vruntime                  : 0.000001
[140550.340845]   .min_vruntime                  : 5348196.175831
[140550.346661]   .max_vruntime                  : 0.000001
[140550.351958]   .spread                        : 0.000000
[140550.357254]   .spread0                       : 5348196.175831
[140550.363070]   .nr_spread_over                : 0
[140550.367758]   .nr_running                    : 1
[140550.372447]   .load                          : 1048576
[140550.377657]   .runnable_weight               : 1048576
[140550.382865]   .load_avg                      : 1023
[140550.387814]   .runnable_load_avg             : 1023
[140550.392763]   .util_avg                      : 1023
[140550.397712]   .removed.load_avg              : 0
[140550.402400]   .removed.util_avg              : 0
[140550.407089]   .removed.runnable_sum          : 0
[140550.411776] 
[140550.411776] rt_rq[3]:
[140550.415684]   .rt_nr_running                 : 0
[140550.420372]   .rt_nr_migratory               : 0
[140550.425061]   .rt_throttled                  : 0
[140550.429750]   .rt_time                       : 0.000000
[140550.435046]   .rt_runtime                    : 950.000000
[140550.440514] 
[140550.440514] dl_rq[3]:
[140550.444422]   .dl_nr_running                 : 0
[140550.449111]   .dl_nr_migratory               : 0
[140550.453799]   .dl_bw->bw                     : 996147
[140550.458921]   .dl_bw->total_bw               : 0
[140550.463612] 
[140550.463612] runnable tasks:
[140550.463612]  S           task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[140550.463612] -----------------------------------------------------------------------------------------------------------
[140550.489829]  I
[140550.489835]       rcu_sched     8   5343760.548831    211733   120 
[140550.491568]         0.000000      3162.689000         0.000000
[140550.497903] 
[140550.505371]  S
[140550.505377]         cpuhp/3    17       191.743474         5   120 
[140550.507109]         0.000000         0.166000         0.000000
[140550.513444] 
[140550.520910]  S
[140550.520916]     migration/3    18         0.000000      5900     0 
[140550.522651]         0.000000       123.737000         0.000000
[140550.528986] 
[140550.536452]  S
[140550.536458]     ksoftirqd/3    19   5343672.053853      2933   120 
[140550.538192]         0.000000       179.278000         0.000000
[140550.544526] 
[140550.551993]  I
[140550.551999]    kworker/3:0H    21       257.036002         7   100 
[140550.553732]         0.000000         0.092000         0.000000
[140550.560068] 
[140550.567535]  I
[140550.567541]          crypto    32         4.982456         2   100 
[140550.569273]         0.000000         0.034000         0.000000
[140550.575609] 
[140550.583075]  I
[140550.583081]         xprtiod    36        13.996474         2   100 
[140550.584814]         0.000000         0.016000         0.000000
[140550.591149] 
[140550.598616]  I
[140550.598622]     kworker/3:1    64   5343760.215831     11324   120 
[140550.600356]         0.000000       231.108000         0.000000
[140550.606691] 
[140550.614157]  S
[140550.614164]            spi2    69   5343124.132067   6850948   120 
[140550.615897]         0.000000     23541.494000         0.000000
[140550.622232] 
[140550.629698]  S
[140550.629704] irq/48-spi2.0 c    71         0.000000         2    49 
[140550.631438]         0.000000         0.037000         0.000000
[140550.637773] 
[140550.645239]  I
[140550.645245]   ipv6_addrconf    72       227.706493         2   100 
[140550.646979]         0.000000         0.017000         0.000000
[140550.653314] 
[140550.660781]  I
[140550.660788]    kworker/3:1H    84   5343672.039175      3293   100 
[140550.662520]         0.000000        52.308000         0.000000
[140550.668855] 
[140550.676321]  S
[140550.676327]          dhcpcd  1459   5343760.321831      8258   120 
[140550.678061]         0.000000       392.803000         0.000000
[140550.684396] 
[140550.691862]  S
[140550.691868]         rpcbind  1579   5343683.365853      4754   120 
[140550.693602]         0.000000       112.454000         0.000000
[140550.699937] 
[140550.707403]  S
[140550.707409]          ypbind  1607      9159.583240        27   120 
[140550.709143]         0.000000         7.497000         0.000000
[140550.715478] 
[140550.722946]  S
[140550.722952]            sshd  1868     11403.021888        25   120 
[140550.724684]         0.000000        56.765000         0.000000
[140550.731019] 
[140550.738485]  S
[140550.738491]            sshd  1870   5343761.045831      1465   120 
[140550.740225]         0.000000       179.955000         0.000000
[140550.746560] 
[140550.754027]  S
[140550.754033] nullmailer-inje 13119   4997398.492047         6   120 
[140550.755766]         0.000000        13.276000         0.000000
[140550.762101] 
[140550.769568]  I
[140550.769574]     kworker/3:2 28213   5342152.730175         3   120 
[140550.771307]         0.000000         0.024000         0.000000
[140550.777642] 
[140550.785109]  I
[140550.785115]    kworker/u8:3 28237   5343760.300831       669   120 
[140550.786848]         0.000000         8.470000         0.000000
[140550.793184] 
[140550.800650] >R
[140550.800655]            bash 28288   5348196.175831       280   120 
[140550.802390]         0.000000      4642.285000         0.000000
[140550.808725] 
[140550.816312] 
[140550.817754] cpu#4
[140550.819752]   .nr_running                    : 1
[140550.824445]   .load                          : 1048576
[140550.829650]   .nr_switches                   : 2766830
[140550.834863]   .nr_load_updates               : 14055075
[140550.840155]   .nr_uninterruptible            : -16
[140550.845022]   .next_balance                  : 4308.992407
[140550.850574]   .curr->pid                     : 74
[140550.855354]   .clock                         : 140550853.137000
[140550.861340]   .clock_task                    : 140550853.137000
[140550.867335]   .cpu_load[0]                   : 1023
[140550.872279]   .cpu_load[1]                   : 1023
[140550.877234]   .cpu_load[2]                   : 1023
[140550.882177]   .cpu_load[3]                   : 1023
[140550.887130]   .cpu_load[4]                   : 1023
[140550.892074]   .avg_idle                      : 7411
[140550.897028]   .max_idle_balance_cost         : 500000
[140550.902145] 
[140550.902145] cfs_rq[4]:
[140550.906140]   .exec_clock                    : 0.000000
[140550.911436]   .MIN_vruntime                  : 0.000001
[140550.916733]   .min_vruntime                  : 32472822.304512
[140550.922636]   .max_vruntime                  : 0.000001
[140550.927932]   .spread                        : 0.000000
[140550.933229]   .spread0                       : 32472822.304512
[140550.939131]   .nr_spread_over                : 0
[140550.943820]   .nr_running                    : 1
[140550.948508]   .load                          : 1048576
[140550.953718]   .runnable_weight               : 1048576
[140550.958927]   .load_avg                      : 1023
[140550.963876]   .runnable_load_avg             : 1024
[140550.968824]   .util_avg                      : 1024
[140550.973773]   .removed.load_avg              : 0
[140550.978461]   .removed.util_avg              : 0
[140550.983150]   .removed.runnable_sum          : 0
[140550.987838] 
[140550.987838] rt_rq[4]:
[140550.991745]   .rt_nr_running                 : 0
[140550.996433]   .rt_nr_migratory               : 0
[140551.001122]   .rt_throttled                  : 0
[140551.005811]   .rt_time                       : 0.000000
[140551.011107]   .rt_runtime                    : 950.000000
[140551.016576] 
[140551.016576] dl_rq[4]:
[140551.020483]   .dl_nr_running                 : 0
[140551.025171]   .dl_nr_migratory               : 0
[140551.029860]   .dl_bw->bw                     : 996147
[140551.034982]   .dl_bw->total_bw               : 0
[140551.039673] 
[140551.039673] runnable tasks:
[140551.039673]  S           task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[140551.039673] -----------------------------------------------------------------------------------------------------------
[140551.065892]  S
[140551.065899]         cpuhp/4    22       236.768346         5   120 
[140551.067630]         0.000000         0.270000         0.000000
[140551.073964] 
[140551.081431]  S
[140551.081437]     migration/4    23         0.000000      5527     0 
[140551.083171]         0.000000       119.219000         0.000000
[140551.089506] 
[140551.096972]  S
[140551.096978]     ksoftirqd/4    24  31209292.142512      2599   120 
[140551.098712]         0.000000       154.908000         0.000000
[140551.105047] 
[140551.112513]  I
[140551.112519]    kworker/4:0H    26       298.607547         7   100 
[140551.114253]         0.000000         0.108000         0.000000
[140551.120588] 
[140551.128054]  I
[140551.128060]           netns    28        -1.043542         2   100 
[140551.129794]         0.000000         0.022000         0.000000
[140551.136129] 
[140551.143596]  I
[140551.143602]         kblockd    33        -1.038427         2   100 
[140551.145335]         0.000000         0.020000         0.000000
[140551.151670] 
[140551.159137]  S
[140551.159143]         kswapd0    37       227.541351         3   120 
[140551.160876]         0.000000         0.051000         0.000000
[140551.167211] 
[140551.174677]  S
[140551.174683]            spi0    65     13242.531636       605   120 
[140551.176417]         0.000000         2.424000         0.000000
[140551.182752] 
[140551.190219] >R
[140551.190225]         mmcqd/0    74  32473102.304512   2790418   120 
[140551.191958]         0.000000  28618329.531000         0.000000
[140551.198293] 
[140551.205759]  I
[140551.205765]    kworker/4:1H    75  32427984.961846      6213   100 
[140551.207499]         0.000000        84.711000         0.000000
[140551.213834] 
[140551.221301]  I
[140551.221307]     kworker/4:1    77  32467913.328512     10253   120 
[140551.223041]         0.000000       200.655000         0.000000
[140551.229375] 
[140551.236843]  I
[140551.236849]     kworker/4:2  1750     19744.590288         3   120 
[140551.238581]         0.000000         0.076000         0.000000
[140551.244916] 
[140551.252384]  D
[140551.252390]    kworker/u8:1 31440   4103199.511512      1683   120 
[140551.254123]         0.000000        61.969000         0.000000
[140551.260458] 
[140551.268019] 
[140551.269487] Showing busy workqueues and worker pools:
[140551.274621] workqueue writeback: flags=0x4e
[140551.278863]   pwq 8: cpus=1-4 flags=0x4 nice=0 active=1/256
[140551.284508]     in-flight: 31440:wb_workfn
[140551.288692] pool 8: cpus=1-4 flags=0x4 nice=0 hung=5s workers=3 idle: 28237 11398

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--=-=-=--

