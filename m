Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3722C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BqW3GsbFUaiVCxP2AGyCNWH6ktj6zlj8PRWA1NWXfSY=; b=C8OKiSn1BIg9zV
	8joODHBb86666j5FkAUM07ZH8SFUUq3BtwGERsZsYZfnzIqGQF6lizT/o/7pYLsMN3t9ErkFvmt1u
	RomHQCHs9UMT0X2W2evU7E5mpeXldhkSSjf/g4RGQS28W2RaCOa99GUvjBlYRat5kyyj+QdoHYmQM
	gtzdQz8Y5E1AFCT7Qx+Y+12GRTXcaEdGwLE+D2HUSU580VJzLALyKzF3wytGBAL2jvBzqt39QktOG
	JD/HQ1SgpuVx2F8UyW5aIQjiwfrDqid8PCe02YrikzgIJp0/5YlX6kQZwuBWDFAFlxL4xZnYjBX+C
	LDtga9ZbDLzjQ/QxBJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvuC-0086oK-0v;
	Fri, 18 Aug 2023 09:36:32 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvu3-0086le-1J
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 09:36:25 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 37I9ZdfW061442;
	Fri, 18 Aug 2023 17:35:39 +0800 (+08)
	(envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Fri, 18 Aug 2023 17:35:37 +0800
Date: Fri, 18 Aug 2023 17:35:14 +0800
From: Leo Liang <ycliang@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
        <vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
        <rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
        <bristot@redhat.com>, <vschneid@redhat.com>,
        <zhouchengming@bytedance.com>, <palmer@rivosinc.com>
CC: <ycliang@andestech.com>, <tim609@andestech.com>, <dylan@andestech.com>
Subject: PROBLEM: LTP cfs_bandwidth01 test bumped into SCHED_WARN_ON after
 de-selecting CONFIG_SMP
Message-ID: <ZN87UsqkWcFLDxea@swlinux02>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 37I9ZdfW061442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_023623_911795_93F269EE 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

We are using upstream buildroot (master branch) to reproduce this problem.
The defconfig we're using is qemu_riscv64_virt_defconfig and the kernel version is 6.4.

After a little bit of git bisecting, we believe is the following commit that cause the issue,
and reverting the commit could fix the problem.

We are not familiar with CFS code, so we are wondering if reverting this patch is the right
thing to do or we should just stay with CONFIG_SMP enabled.

Does anybody has any comments ?

================= This commit is somewhere between v5.18 and v5.19-rc1 =======================
commit 0a00a354644ee1800d31c47cf5927b9b50272fac
Author: Chengming Zhou <zhouchengming@bytedance.com>
Date:   Fri Apr 8 19:53:09 2022 +0800

    sched/fair: Delete useless condition in tg_unthrottle_up()

    We have tested cfs_rq->load.weight in cfs_rq_is_decayed(),
    the first condition "!cfs_rq_is_decayed(cfs_rq)" is enough
    to cover the second condition "cfs_rq->nr_running".

    Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Reviewed-by: Ben Segall <bsegall@google.com>
    Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
    Link: https://lore.kernel.org/r/20220408115309.81603-2-zhouchengming@bytedance.com

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f74b34080c9a..3eba0dcc4962 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4850,7 +4850,7 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
                                             cfs_rq->throttled_clock_pelt;

                /* Add cfs_rq with load or one or more already running entities to the list */
-               if (!cfs_rq_is_decayed(cfs_rq) || cfs_rq->nr_running)
+               if (!cfs_rq_is_decayed(cfs_rq))
                        list_add_leaf_cfs_rq(cfs_rq);
        }
===============================================================================================

The reproducing step is as follows:
$ cd buildroot
$ make qemu_riscv64_virt_defconfig
$ make menuconfig					## choose 6.4 kernel and choose LTP testsuite
$ make
$ make linux-menuconfig				## de-select CONFIG_SMP
$ make linux-rebuild
$ ./output/images/start-qemu.sh

...
Welcome to Buildroot
buildroot login: root
# /usr/lib/ltp-testsuite/testcases/bin/cfs_bandwidth01
tst_kconfig.c:87: TINFO: Parsing kernel config '/proc/config.gz'
tst_cgroup.c:679: TINFO: Mounted V2 CGroups on /tmp/cgroup_unified
tst_cgroup.c:737: TINFO: Mounted V1 cpu CGroup on /tmp/cgroup_cpu
tst_test.c:1558: TINFO: Timeout per run is 0h 00m 50s
cfs_bandwidth01.c:54: TINFO: Set 'worker1/cpu.max' = '3000 10000'
cfs_bandwidth01.c:54: TINFO: Set 'worker2/cpu.max' = '2000 10000'
cfs_bandwidth01.c:54: TINFO: Set 'worker3/cpu.max' = '3000 10000'
cfs_bandwidth01.c:117: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:54: TINFO: Set 'level2/cpu.max' = '5000 10000'
[   16.625892] ------------[ cut here ]------------
[   16.626169] rq->tmp_alone_branch != &rq->leaf_cfs_rq_list
[   16.626337] WARNING: CPU: 0 PID: 0 at kernel/sched/fair.c:437 unthrottle_cfs_rq+0x3b4/0x3b8
[   16.626781] Modules linked in:
[   16.626988] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0 #2
[   16.627205] Hardware name: riscv-virtio,qemu (DT)
[   16.627368] epc : unthrottle_cfs_rq+0x3b4/0x3b8
[   16.627511]  ra : unthrottle_cfs_rq+0x3b4/0x3b8
[   16.627640] epc : ffffffff80031f3e ra : ffffffff80031f3e sp : ffffffff81003b10
[   16.627816]  gp : ffffffff810e1078 tp : ffffffff8100d5c0 t0 : ffffffff8101a960
[   16.627989]  t1 : 0720072007200720 t2 : 2d2d2d2d2d2d2d2d s0 : ffffffff81003b90
[   16.628162]  s1 : 0000000000000000 a0 : 000000000000002d a1 : ffffffff810872b8
[   16.628328]  a2 : 0000000000000010 a3 : 0000000000000001 a4 : 0000000000000000
[   16.628498]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 000000000000002d
[   16.628667]  s2 : ffffffff81016170 s3 : ff60000002232c00 s4 : 0000000000000000
[   16.628853]  s5 : ffffffff81016140 s6 : 0000000000000002 s7 : 0000000000000001
[   16.629021]  s8 : 0000000000000002 s9 : 0000000000000001 s10: 0000000000113833
[   16.629190]  s11: 0000000000989680 t3 : ff60000001218f00 t4 : ff60000001218f00
[   16.629367]  t5 : ff60000001218000 t6 : ffffffff810038f8
[   16.629493] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   16.629756] [<ffffffff80032030>] distribute_cfs_runtime+0xee/0x12a
[   16.629946] [<ffffffff800321ee>] sched_cfs_period_timer+0xdc/0x1e6
[   16.630101] [<ffffffff80055432>] __hrtimer_run_queues.constprop.0+0x12a/0x1b0
[   16.630272] [<ffffffff80055e6e>] hrtimer_interrupt+0xe0/0x1f2
[   16.630411] [<ffffffff804c59d2>] riscv_timer_interrupt+0x1c/0x26
[   16.630557] [<ffffffff80044a62>] handle_percpu_devid_irq+0x50/0xd6
[   16.630703] [<ffffffff800409c8>] generic_handle_domain_irq+0x1c/0x2a
[   16.630855] [<ffffffff8030ac0a>] riscv_intc_irq+0x2e/0x46
[   16.630990] [<ffffffff80634dba>] generic_handle_arch_irq+0x34/0x4e
[   16.631139] [<ffffffff80003280>] ret_from_exception+0x0/0xc
[   16.631343] ---[ end trace 0000000000000000 ]---
cfs_bandwidth01.c:129: TPASS: Workers exited
tst_test.c:1601: TFAIL: Kernel is now tainted.

Best regards,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
