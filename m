Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A66C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo+06pigKvgL/pe/TV/TBoJJ9TvbQ1PKKLQ/6Lz4DXY=; b=Zw9tWJJkk1AKnmtF4VRjMGTw2y
	jSlmQQonG4RCvdElq2UepsP9VFzWrjprbvpp5SaJvyrbODE3cb44qv77fMC6Og8HISxDIS4tnO4ra
	EvJWEzGpZsrduvIJTLN14ZDdpa7EmLiSkNCQkb8gee5XalWhTh5JSMGGbFjsWwZ+j7GwpXWz1a2BY
	G1VotP8/brcPN0C2FOdEcjJ8JAx1gapqcDB0SMUXKPSfKD6S1F1GGhMHyCV8f7NWMSFtcqejvl3dU
	7m8euG8LJD5Pcq79Rs1fbUAAZDV31jENZTxbhuk31xTFHU+53f6CAy18tCPij5o6pgGaH9Xcrma2Z
	WyPp0eDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWrp-009SSw-1W;
	Thu, 02 Nov 2023 12:32:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWrj-009SRn-2q
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698928323; x=1730464323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2v0pphgeHL9ONP5or0nHHKXHq+IavAYsLLK/zLtnbFw=;
  b=l5vyfPe7HKAdjrKiEYyYraCUIXQkm+Zaqk3nPMl/nyjCfR79pMF471Iu
   67SZAySe1/T0gAgd5HWbQ3LVBYkpubTVPgSu/B1dPMKiDOabN1gan67ew
   ADsrcF3KBZX0cb0qKbro6/HDZJJHq3bsrKmLXq6l2zhoK9yoLBBpGguik
   FrnmUWqhiiyn1R+nMJfKQXjenX1URN31nBCkXbWuIWULjbaUA8AkTDkui
   9sVXHgo3Xvu8FwM4G6/OO4GsO6MttRtgbncw7f0x3wjdWekru++cmhXxO
   Q+673uQLtAGD2+dSIAFO1zv6CLKxCuCkmDv3cXntplk/Z0Pz34ngg0k7v
   w==;
X-CSE-ConnectionGUID: iHoMR+rgTy+2acfcMV9V5g==
X-CSE-MsgGUID: 92JtOA7MS7e2GzToJEHZOQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="asc'?scan'208";a="11656272"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 05:31:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Nov 2023 05:31:41 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 2 Nov 2023 05:31:39 -0700
Date: Thu, 2 Nov 2023 12:31:15 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner
	<tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <tobias.schaffner@siemens.com>, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231102-spearman-overcrowd-a86bfb958609@wendy>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZUI5h6eIhTlPAmGh@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_053204_026081_80F8F77E 
X-CRM114-Status: GOOD (  30.76  )
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
Content-Type: multipart/mixed; boundary="===============4415168448314554132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4415168448314554132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fo1tOVV7+bVeS/xw"
Content-Disposition: inline

--fo1tOVV7+bVeS/xw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 07:41:59PM +0800, Jisheng Zhang wrote:
> On Tue, Oct 31, 2023 at 05:44:11PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2023-10-31 23:49:29 [+0800], Jisheng Zhang wrote:
> > > Yes there's no third patch. I didn't use the correct number in patch0=
's
> > > subject.
> >=20
> > So it looks fine. The warning was CPU-hotplug related
> > 	https://lore.kernel.org/all/0abd0acf-70a1-d546-a517-19efe60042d1@micro=
chip.com/
> >=20
> > and it looks to be gone as of commit
> > 	5944ce092b97c ("arch_topology: Build cacheinfo from primary CPU")
> >=20
> > so that good. Any double checking is welcome of course ;)
> > JUMP_LABELs don't use stop_cpu. Check.
> > The timer is PERCPU. Check.
> > Can't find perf events. But the commit for threaded interrupts claims to
> > have them per-CPU.=20
> > Has HAVE_POSIX_CPU_TIMERS_TASK_WORK with generic kvm. Check.
> >=20
> > die() and die_lock. It looks like die_lock is acquired when the system
> > is done and requires medical assistance. This would qualify it for a
> > raw_spinlock_t. Also, should any of the bad things happen in a section
> > with disabled preemption or interrupts then a spinlock_t can not be
> > acquired. Unless die() is always invoked in a preemptible context=E2=80=
=A6
> >=20
> > The other things are covered by the generic code. I think I didn't miss
> > anything=E2=80=A6
> > I going to have new release by the end of the week at the latest with
> > this bits. Please look after the die_lock.
>=20
> Thank you so much, I will check.
>=20
> Hi @Conor,
>=20
> If you help to try this series, can you please apply Evan' misaligned
> access probe probe patch? Refer to [1] for details. NOTE: this is not
> related with RT patches because I can reproduce the bug with v6.6.

Hmm, so I gave it a go with and without Evan's patch, but I am seeing
various issues with locking. For example, here's one with Evan's patch:

Starting kernel ...

[    0.000000] Linux version 6.6.0-rc6-rt10-00003-gd649dd498753 (conor@wend=
y) (ClangBuiltLinux clang version 16.0.2 (/
home/conor/stuff/dev/llvm/clang 18ddebe1a1a9bde349441631365f0472e9693520), =
ClangBuiltLinux LLD 16.0.2) #1 SMP PREEMPT_
RT @666
[    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
[    0.000000] SBI specification v1.0 detected
[    0.000000] SBI implementation ID=3D0x8 Version=3D0x10002
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI SRST extension detected
[    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '1=
15200n8')
[    0.000000] printk: legacy bootconsole [ns16550a0] enabled
[    0.000000] printk: debug: skip boot console de-registration.
[    0.000000] efi: UEFI not found.
[    0.000000] OF: reserved mem: 0x00000000bfc00000..0x00000000bfffffff (40=
96 KiB) nomap non-reusable region@BFC00000
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000107fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000bfbfffff]
[    0.000000]   node   0: [mem 0x00000000bfc00000-0x00000000bfffffff]
[    0.000000]   node   0: [mem 0x0000001040000000-0x000000107fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000107ffff=
fff]
[    0.000000] SBI HSM extension detected
[    0.000000] CPU with hartid=3D0 is not available
[    0.000000] Falling back to deprecated "riscv,isa"
[    0.000000] riscv: base ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 31 pages/cpu s88096 r8192 d30688 u126976
[    0.000000] Kernel command line: earlycon keep_bootcon riscv_isa_fallback
[    0.000000] Unknown kernel command line parameters "riscv_isa_fallback",=
 will be passed to user space.
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 517120
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x00000000bbc00000-0x00000000bf=
c00000] (64MB)
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffc6fea00000 - 0xffffffc6ff000000   (61=
44 kB)
[    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  =
16 MB)
[    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (40=
96 MB)
[    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  =
64 GB)
[    0.000000]      modules : 0xffffffff02a26000 - 0xffffffff80000000   (20=
05 MB)
[    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffe800000000   (  =
64 GB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (20=
47 MB)
[    0.000000] Memory: 1914732K/2097152K available (12175K kernel code, 726=
4K rwdata, 6144K rodata, 6211K init, 11249K bss, 182420K reserved, 0K cma-r=
eserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] trace event string verifier disabled
[    0.000000] Running RCU self tests
[    0.000000] Running RCU synchronous self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_id=
s=3D4.
[    0.000000] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    0.000000] rcu:     RCU_SOFTIRQ processing moved to rcuc kthreads.
[    0.000000] rcu:     RCU debug extended QS entry/exit.
[    0.000000]  No expedited grace period (rcu_normal_after_boot).
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] Running RCU synchronous self tests
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt=
-controller
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 186 interrupts wi=
th 4 handlers for 9 contexts.
[    0.000000] riscv: providing IPIs using SBI IPI extension
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max=
_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000003] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps ev=
ery 2199023255500ns
[    0.003776] Console: colour dummy device 80x25
[    0.003879] printk: legacy console [tty0] enabled
[    0.004090] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,=
 Ingo Molnar
[    0.004107] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.004121] ... MAX_LOCK_DEPTH:          48
[    0.004135] ... MAX_LOCKDEP_KEYS:        8192
[    0.004148] ... CLASSHASH_SIZE:          4096
[    0.004161] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.004175] ... MAX_LOCKDEP_CHAINS:      65536
[    0.004188] ... CHAINHASH_SIZE:          32768
[    0.004200]  memory used by lock dependency info: 6493 kB
[    0.004215]  memory used for stack traces: 4224 kB
[    0.004228]  per task-struct memory footprint: 1920 bytes
[    0.005187] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 2.00 BogoMIPS (lpj=3D4000)
[    0.005236] pid_max: default: 32768 minimum: 301
[    0.009319] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,=
 linear)
[    0.009520] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes, linear)
[    0.030982] Running RCU synchronous self tests
[    0.031032] Running RCU synchronous self tests
[    0.036925] CPU node for /cpus/cpu@0 exist but the possible cpu range is=
 :0-3
[    0.055142] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.056482] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.058104] Running RCU-tasks wait API self tests
[    0.064370] riscv: ELF compat mode unsupported
[    0.064417] ASID allocator disabled (0 bits)
[    0.071600] Callback from call_rcu_tasks_trace() invoked.
[    0.072487] rcu: Hierarchical SRCU implementation.
[    0.072504] rcu:     Max phase no-delay instances is 1000.
[    0.753395] EFI services will not be available.
[    0.765374] smp: Bringing up secondary CPUs ...
[    0.826425] smp: Brought up 1 node, 4 CPUs
[    0.859509] devtmpfs: initialized
[    1.033554] Running RCU synchronous self tests
[    1.033791] Running RCU synchronous self tests
[    1.044502] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    1.044965] futex hash table entries: 1024 (order: 5, 196608 bytes, line=
ar)
[    1.049859] pinctrl core: initialized pinctrl subsystem
[    1.076426] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    1.093390] Callback from call_rcu_tasks() invoked.
[    1.099141] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocat=
ions
[    1.099644] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atom=
ic allocations
[    1.123261] cpuidle: using governor menu
[    1.130384] BUG: sleeping function called from invalid context at kernel=
/locking/spinlock_rt.c:48
[    1.130418]
[    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, na=
me: swapper/1
[    1.130431] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.130440] WARNING: inconsistent lock state
[    1.130439] preempt_count: 10001, expected: 0
[    1.130454] RCU nest depth: 1, expected: 1
[    1.130452] 6.6.0-rc6-rt10-00003-gd649dd498753 #1 Not tainted
[    1.130468] INFO: lockdep is turned off.
[    1.130470] --------------------------------
[    1.130477] irq event stamp: 1026
[    1.130479] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[    1.130496] swapper/3/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
[    1.130487] hardirqs last  enabled at (1025): [<ffffffff80bd5308>] do_ir=
q+0x7e/0xa6
[    1.130525] ffffffff81c42d38 (
[    1.130533] hardirqs last disabled at (1026): [<ffffffff80bd52a0>] do_ir=
q+0x16/0xa6
[    1.130550] &zone->lock){?.+.}-{2:2}
[    1.130562] softirqs last  enabled at (0): [<ffffffff8001543c>] copy_pro=
cess+0x548/0xdec
[    1.130577] , at: __rmqueue_pcplist+0x12a/0xbc0
[    1.130611] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    1.130626] {HARDIRQ-ON-W} state was registered at:
[    1.130638] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc6-rt10-000=
03-gd649dd498753 #1
[    1.130639]   __lock_acquire+0x80a/0xd52
[    1.130668] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    1.130684] Call Trace:
[    1.130681]   lock_acquire+0x116/0x2b0
[    1.130697] [<ffffffff80006fca>] show_stack+0x2c/0x3c
[    1.130709]   rt_spin_lock+0x26/0xdc
[    1.130747]   __rmqueue_pcplist+0x12a/0xbc0
[    1.130740] [<ffffffff80bd4c38>] dump_stack_lvl+0x5e/0x84
[    1.130777]   get_page_from_freelist+0x37a/0x143e
[    1.130787] [<ffffffff80bd4c72>] dump_stack+0x14/0x1c
[    1.130806]   __alloc_pages+0xac/0x1be
[    1.130822] [<ffffffff8005ba84>] __might_resched+0x1b4/0x1c2
[    1.130835]   alloc_slab_page+0x1c/0xc0
[    1.130863]   new_slab+0x94/0x336
[    1.130861] [<ffffffff80bdfdd2>] rt_spin_lock+0x42/0xdc
[    1.130886]   ___slab_alloc+0x830/0xcda
[    1.130896] [<ffffffff80267236>] __rmqueue_pcplist+0x12a/0xbc0
[    1.130909]   __kmem_cache_alloc_node+0xc8/0x1c4
[    1.130934] [<ffffffff80268204>] get_page_from_freelist+0x37a/0x143e
[    1.130934]   kmalloc_trace+0x22/0x48
[    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
[    1.130978]   alloc_workqueue+0x96/0x6de
[    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
[    1.131010]   kmem_cache_init_late+0x1c/0x36
[    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12=
/0x1a
[    1.131046]   start_kernel+0x204/0x7e6
[    1.131082] irq event stamp: 822
[    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0=
x790
[    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] defaul=
t_idle_call+0xfa/0x152
[    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_interr=
upt+0xe/0x1a
[    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do_irq=
+0x16/0xa6
[    1.131146] [<ffffffff80009edc>] handle_IPI+0x54/0x13c
[    1.131153] softirqs last  enabled at (0): [<ffffffff8001543c>] copy_pro=
cess+0x548/0xdec
[    1.131190] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    1.131184] [<ffffffff800a65e6>] handle_percpu_devid_irq+0xc8/0x1c0
[    1.131211]
[    1.131211] other info that might help us debug this:
[    1.131220]  Possible unsafe locking scenario:
[    1.131220]
[    1.131228]        CPU0
[    1.131235]        ----
[    1.131229] [<ffffffff8009fd96>] generic_handle_domain_irq+0x2c/0x40
[    1.131241]   lock(&zone->lock);
[    1.131266]   <Interrupt>
[    1.131272]     lock(
[    1.131261] [<ffffffff800ae39c>] ipi_mux_process+0xb0/0x102
[    1.131279] &zone->lock);
[    1.131294]
[    1.131294]  *** DEADLOCK ***
[    1.131294]
[    1.131302] 2 locks held by swapper/3/0:
[    1.131298] [<ffffffff8000c0ec>] sbi_ipi_handle+0x50/0x7c
[    1.131320]  #0: ffffffe7fefcf958
[    1.131328] [<ffffffff8009fd96>] generic_handle_domain_irq+0x2c/0x40
[    1.131341]  (&pcp->lock){+.+.}-{2:2}
[    1.131358] [<ffffffff805ce5dc>] riscv_intc_irq+0x28/0x44
[    1.131370] , at: get_page_from_freelist+0x338/0x143e
[    1.131402]  #1:
[    1.131394] [<ffffffff80bd5370>] handle_riscv_irq+0x40/0x64
[    1.131411] ffffffff81aa6960 (rcu_read_lock
[    1.131423] [<ffffffff80bd52ea>] do_irq+0x60/0xa6
[    1.131437] ){....}-{1:2}, at: rcu_lock_acquire+0x0/0x32
[    1.131478]
[    1.131478] stack backtrace:
[    1.131488] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6=
=2E6.0-rc6-rt10-00003-gd649dd498753 #1
[    1.131518] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    1.131530] Call Trace:
[    1.131542] [<ffffffff80006fca>] show_stack+0x2c/0x3c
[    1.131576] [<ffffffff80bd4c38>] dump_stack_lvl+0x5e/0x84
[    1.131614] [<ffffffff80bd4c72>] dump_stack+0x14/0x1c
[    1.131648] [<ffffffff8008c66a>] print_usage_bug+0x430/0x4d2
[    1.131686] [<ffffffff8008bf6e>] mark_lock_irq+0x504/0x61c
[    1.131720] [<ffffffff8008b64e>] mark_lock+0x12e/0x194
[    1.131753] [<ffffffff80088d3a>] __lock_acquire+0x5d2/0xd52
[    1.131786] [<ffffffff800884fa>] lock_acquire+0x116/0x2b0
[    1.131819] [<ffffffff80bdfdb6>] rt_spin_lock+0x26/0xdc
[    1.131852] [<ffffffff80267236>] __rmqueue_pcplist+0x12a/0xbc0
[    1.131887] [<ffffffff80268204>] get_page_from_freelist+0x37a/0x143e
[    1.131922] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
[    1.131955] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
[    1.131986] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12=
/0x1a
[    1.132018] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0=
x790
[    1.132052] [<ffffffff800fd3a0>] generic_smp_call_function_single_interr=
upt+0xe/0x1a
[    1.132085] [<ffffffff80009edc>] handle_IPI+0x54/0x13c
[    1.132119] [<ffffffff800a65e6>] handle_percpu_devid_irq+0xc8/0x1c0
[    1.132154] [<ffffffff8009fd96>] generic_handle_domain_irq+0x2c/0x40
[    1.132184] [<ffffffff800ae39c>] ipi_mux_process+0xb0/0x102
[    1.132216] [<ffffffff8000c0ec>] sbi_ipi_handle+0x50/0x7c
[    1.132244] [<ffffffff8009fd96>] generic_handle_domain_irq+0x2c/0x40
[    1.132273] [<ffffffff805ce5dc>] riscv_intc_irq+0x28/0x44
[    1.132303] [<ffffffff80bd5370>] handle_riscv_irq+0x40/0x64
[    1.132331] [<ffffffff80bd52ea>] do_irq+0x60/0xa6
[    1.156457] cpu1: Ratio of byte access time to unaligned word access is =
0.01, unaligned accesses are slow
[    1.156464] cpu3: Ratio of byte access time to unaligned word access is =
0.01, unaligned accesses are slow
[    1.156465] cpu2: Ratio of byte access time to unaligned word access is =
0.01, unaligned accesses are slow
[    1.184777] cpu0: Ratio of byte access time to unaligned word access is =
0.01, unaligned accesses are slow


The exact tree/.config are here:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dli=
nux-6.6.y-rt

Cheers,
Conor.


--fo1tOVV7+bVeS/xw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUOWkwAKCRB4tDGHoIJi
0tCMAP4q7RJKMcVeK83gfgzaofaMMw0sWnwhD56JriTvdSiXgwD8C854PV/Dew4Q
a7ckLLJEOHlh1nGOqIQ8srPfqlf4Nwk=
=3OP2
-----END PGP SIGNATURE-----

--fo1tOVV7+bVeS/xw--


--===============4415168448314554132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4415168448314554132==--

