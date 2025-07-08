Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A59CA0EE0
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oMI/gBRXo+MBWMjh7+S8TOTtRQowIHpnvDdiezGvLXQ=; b=UYh0NcOQbjkJSv
	cjjMGDHhnF8ll/LePjM3L6u+C0ISsuhRIQL5f6ybEEvN0O4XIigFlh7nmbc8QXIIT+T39ZBKVXD+e
	fSKn4nZ23WY+6i2DqHWSyLrN8LrNj/Va0Yyz2Lism7dHZrbjLqHZj75/bRqDbQCSCchfQv3qsQiXF
	Jlsn9rDUDEkd+rdcUg203wn/vnbSan+qICTaZr2eprUFDYnQKCqs7NVdhWlRfibEV0GrXr4kt/lp6
	rCZdmrVp2MeVoyfS50eJnwm2nHLzuvmm4W0kpfysGsx8JhdBlLCyfS9h8/3oyVh2BHSZaWh4GywKE
	8gQ9FASdIEAn0DEEx/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx22-0000000C6r6-1MHH;
	Tue, 12 Aug 2025 21:59:46 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ51O-00000004xwC-29wh
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 09:53:56 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 69D251F38D
	for <linux-riscv@lists.infradead.org>; Tue,  8 Jul 2025 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751968431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=iuGITeY6NFWFAkeW+2Tl3VgQAcWw4E2xqnr2QZZKrKA=;
	b=u9gZxruHsHhZt3bC6YyJcBzFjRWYGs0mJMx9S+6Vi+ROGqT0VBB+JxrkKzUwBcw3rT4Efl
	s25ytZkcG5h97zvPXDkVKgCN+UsmPwoWB8DxFtnawtFHkHKLEx+qXZ+TMVudriLoyvCC8l
	6D0JTsmGW5e+1RFX4c55RW9B6G+J6QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751968431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=iuGITeY6NFWFAkeW+2Tl3VgQAcWw4E2xqnr2QZZKrKA=;
	b=DLz/R8dpqJIBMSQ1Tf4CysTzq3FkwY10VkFNwgyU0QyWHSra8EkyToqgbdMw/rcWuWnBLC
	dmIeixiTL37pDHCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u9gZxruH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="DLz/R8dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751968431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=iuGITeY6NFWFAkeW+2Tl3VgQAcWw4E2xqnr2QZZKrKA=;
	b=u9gZxruHsHhZt3bC6YyJcBzFjRWYGs0mJMx9S+6Vi+ROGqT0VBB+JxrkKzUwBcw3rT4Efl
	s25ytZkcG5h97zvPXDkVKgCN+UsmPwoWB8DxFtnawtFHkHKLEx+qXZ+TMVudriLoyvCC8l
	6D0JTsmGW5e+1RFX4c55RW9B6G+J6QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751968431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=iuGITeY6NFWFAkeW+2Tl3VgQAcWw4E2xqnr2QZZKrKA=;
	b=DLz/R8dpqJIBMSQ1Tf4CysTzq3FkwY10VkFNwgyU0QyWHSra8EkyToqgbdMw/rcWuWnBLC
	dmIeixiTL37pDHCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 52B104A05E9; Tue,  8 Jul 2025 11:53:51 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: openSBI 1.7 causes v6.16-rc boot to hang on VisionFive 2
Date: Tue, 08 Jul 2025 11:53:51 +0200
Message-ID: <mvm34b7knyo.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.28 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.99)[0.996];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 69D251F38D
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_025354_863985_D88B1907 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 12 Aug 2025 14:55:28 -0700
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

openSBI 1.7 implements the FWFT extension, and thus enables the use of
misaligned access exception delegation in v6.16-rc.  This causes the
boot to hang on the VisionFive 2 v1.2a.

[    0.000000][    T0] Booting Linux on hartid 3
[    0.000000][    T0] Linux version 6.16.0-rc4-2.g79f1960-default (geeko@buildhost) (gcc (SUSE Linux) 15.1.1 20250626, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.43.1.20241209-8) #1 SMP PREEMPT_DYNAMIC Thu Jul  3 03:01:03 UTC 2025 (79f1960)
[    0.000000][    T0] Machine model: StarFive VisionFive 2 v1.2A
[    0.000000][    T0] SBI specification v3.0 detected
[    0.000000][    T0] SBI implementation ID=0x1 Version=0x10007
[    0.000000][    T0] SBI TIME extension detected
[    0.000000][    T0] SBI IPI extension detected
[    0.000000][    T0] SBI RFENCE extension detected
[    0.000000][    T0] SBI SRST extension detected
[    0.000000][    T0] SBI DBCN extension detected
[    0.000000][    T0] SBI FWFT extension detected
[    0.000000][    T0] printk: debug: ignoring loglevel setting.
[    0.000000][    T0] efi: EFI v2.11 by Das U-Boot
[    0.000000][    T0] efi: RTPROP=0xfe6cc040 SMBIOS 3.0=0xff72b000 INITRD=0xfe6a9040 RNG=0xfe6a8040 MEMRESERVE=0xfe6a7040 
[    0.000000][    T0] random: crng init done
[    0.000000][    T0] Reserved memory: created CMA memory pool at 0x0000000070000000, size 512 MiB
[    0.000000][    T0] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000][    T0] OF: reserved mem: 0x0000000070000000..0x000000008fffffff (524288 KiB) map reusable linux,cma
[    0.000000][    T0] earlycon: uart0 at MMIO32 0x0000000010000000 (options '115200n8')
[    0.000000][    T0] printk: legacy bootconsole [uart0] enabled
[    0.000000][    T0] OF: reserved mem: 0x0000000040040000..0x000000004005ffff (128 KiB) nomap non-reusable mmode_resv0@40040000
[    0.000000][    T0] OF: reserved mem: 0x0000000040000000..0x000000004003ffff (256 KiB) nomap non-reusable mmode_resv1@40000000
[    0.000000][    T0] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000][    T0] NODE_DATA(0) allocated [mem 0x13fdb30c0-0x13fdb587f]
[    0.000000][    T0] Zone ranges:
[    0.000000][    T0]   DMA32    [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000][    T0]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
[    0.000000][    T0]   Device   empty
[    0.000000][    T0] Movable zone start for each node
[    0.000000][    T0] Early memory node ranges
[    0.000000][    T0]   node   0: [mem 0x0000000040000000-0x000000004005ffff]
[    0.000000][    T0]   node   0: [mem 0x0000000040060000-0x00000000fe6cbfff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6cc000-0x00000000fe6ccfff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6cd000-0x00000000fe6cdfff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6ce000-0x00000000fe6effff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6f0000-0x00000000ff72afff]
[    0.000000][    T0]   node   0: [mem 0x00000000ff72b000-0x00000000ff72bfff]
[    0.000000][    T0]   node   0: [mem 0x00000000ff72c000-0x00000000fff26fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fff27000-0x00000000fff28fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fff29000-0x000000013fffffff]
[    0.000000][    T0] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000][    T0] SBI HSM extension detected
[    0.000000][    T0] CPU with hartid=0 is not available
[    0.000000][    T0] riscv: base ISA extensions acdfim
[    0.000000][    T0] riscv: ELF capabilities acdfim
[    0.000000][    T0] Ticket spinlock: enabled
[    0.000000][    T0] percpu: Embedded 54 pages/cpu s95128 r8192 d117864 u221184
[    0.000000][    T0] pcpu-alloc: s95128 r8192 d117864 u221184 alloc=54*4096
[    0.000000][    T0] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000][    T0] Kernel command line: BOOT_IMAGE=/boot/Image-6.16.0-rc4-2.g79f1960-default root=UUID=6d8545d7-893d-46d3-ba3c-29a82457c120 ignore_loglevel earlycon mitigations=auto quiet security=selinux selinux=1 console=uart0,115200
[    0.000000][    T0] Unknown kernel command line parameters "BOOT_IMAGE=/boot/Image-6.16.0-rc4-2.g79f1960-default", will be passed to user space.
[    0.000000][    T0] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.000000][    T0] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000][    T0] software IO TLB: area num 4.
[    0.000000][    T0] software IO TLB: mapped [mem 0x00000000fa6a5000-0x00000000fe6a5000] (64MB)
[    0.000000][    T0] Fallback order for Node 0: 0 
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total pages: 1048576
[    0.000000][    T0] Policy zone: Normal
[    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000][    T0] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000][    T0] ftrace: allocating 44199 entries in 173 pages
[    0.000000][    T0] ftrace: allocated 173 pages with 5 groups
[    0.000000][    T0] Dynamic Preempt: voluntary
[    0.000000][    T0] rcu: Preemptible hierarchical RCU implementation.
[    0.000000][    T0] rcu:     RCU restricting CPUs from NR_CPUS=32 to nr_cpu_ids=4.
[    0.000000][    T0]  Trampoline variant of Tasks RCU enabled.
[    0.000000][    T0]  Rude variant of Tasks RCU enabled.
[    0.000000][    T0]  Tracing variant of Tasks RCU enabled.
[    0.000000][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000][    T0] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000][    T0] riscv-intc: 64 local interrupts mapped
[    0.000000][    T0] riscv: providing IPIs using SBI IPI extension
[    0.000000][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000][    T0] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 881590404240 ns
[    0.000001][    T0] sched_clock: 64 bits at 4MHz, resolution 250ns, wraps every 2199023255500ns
[    0.010196][    T0] Console: colour dummy device 80x25
[    0.016087][    T0] Calibrating delay loop (skipped), value calculated using timer frequency.. 8.00 BogoMIPS (lpj=16000)
[    0.028040][    T0] pid_max: default: 32768 minimum: 301
[    0.034172][    T0] LSM: initializing lsm=lockdown,capability,landlock,yama,selinux,bpf,ima,evm
[    0.044030][    T0] landlock: Up and running.
[    0.048823][    T0] Yama: becoming mindful.
[    0.053455][    T0] SELinux:  Initializing.
[    0.059755][    T0] LSM support for eBPF active
[    0.065279][    T0] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.074247][    T0] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.085431][    T1] CPU node for /cpus/cpu@0 exist but the possible cpu range is :0-3
[    0.095708][    T1] riscv: ELF compat mode unsupported
[    0.095723][    T1] ASID allocator disabled (0 bits)
[    0.107006][    T1] rcu: Hierarchical SRCU implementation.
[    0.113042][    T1] rcu:     Max phase no-delay instances is 1000.
[    0.119883][    T1] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.130459][    T1] Remapping and enabling EFI services.
[    0.136916][    T1] smp: Bringing up secondary CPUs ...
[    0.145836][    T1] smp: Brought up 1 node, 4 CPUs
[    0.164384][   T39] node 0 deferred pages initialised in 12ms
[    0.170794][    T1] Memory: 3417124K/4194304K available (12690K kernel code, 8597K rwdata, 12288K rodata, 8436K init, 912K bss, 247032K reserved, 524288K cma-reserved)
[    0.189211][    T1] devtmpfs: initialized
[    0.210172][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.221733][    T1] posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.230748][    T1] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
[    0.253706][    T1] pinctrl core: initialized pinctrl subsystem
[    0.261396][    T1] SMBIOS 3.7.0 present.
[    0.265835][    T1] DMI: starfive StarFive VisionFive 2 v1.2A/StarFive VisionFive 2 v1.2A, BIOS 2025.07 07/01/2025
[    0.277228][    T1] DMI: Memory slots populated: 0/0
[    0.287095][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.295476][    T1] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.304118][    T1] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.313703][    T1] audit: initializing netlink subsys (disabled)
[    0.320706][   T48] audit: type=2000 audit(0.176:1): state=initialized audit_enabled=0 res=1
[    0.321517][    T1] thermal_sys: Registered thermal governor 'fair_share'
[    0.329993][    T1] thermal_sys: Registered thermal governor 'bang_bang'
[    0.337455][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    0.344820][    T1] thermal_sys: Registered thermal governor 'user_space'
[    0.352251][    T1] cpuidle: using governor ladder
[    0.365021][    T1] cpuidle: using governor menu
[    0.370454][    T1] SBI misaligned access exception delegation ok
[    0.377321][    T1] CCACHE: 8 banks, 16 ways, sets/bank=256, bytes/block=64
[    0.384978][    T1] CCACHE: Index of the largest way enabled: 15
[    0.392070][    T1] Serial: AMBA PL011 UART driver
[    0.403770][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /dsi_encoder
[    0.413279][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.423291][    T1] /soc/hdmi@29590000: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.445038][    T1] /dsi_encoder: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.454497][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /dsi_encoder
[    0.463959][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.474209][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.484257][    T1] /soc/hdmi@29590000: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.495655][    T1] /soc/pcie@940000000: Fixed dependency cycle(s) with /soc/pcie@940000000/interrupt-controller
[    0.507461][    T1] /soc/pcie@9c0000000: Fixed dependency cycle(s) with /soc/pcie@9c0000000/interrupt-controller
[    0.522051][    T1] HugeTLB: allocation took 0ms with hugepage_allocation_threads=1
[    0.530496][    T1] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.538725][    T1] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.546760][    T1] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.554983][    T1] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.566084][    T1] ACPI: Interpreter disabled.
[    0.571339][    T1] iommu: Default domain type: Passthrough
[    0.578419][    T1] EDAC MC: Ver: 3.0.0
[    0.583097][    T1] efivars: Registered efivars operations
[    0.591406][    T1] NetLabel: Initializing
[    0.595925][    T1] NetLabel:  domain hash size = 128
[    0.601477][    T1] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.608542][    T1] NetLabel:  unlabeled traffic allowed by default
[    0.615452][    T1] mctp: management component transport protocol core
[    0.622629][    T1] NET: Registered PF_MCTP protocol family
[    0.629199][    T1] vgaarb: loaded
[    0.633420][    T1] clocksource: Switched to clocksource riscv_clocksource
[    0.641993][    T1] VFS: Disk quotas dquot_6.6.0
[    0.647204][    T1] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.656029][    T1] pnp: PnP ACPI: disabled
[    0.674024][    T1] NET: Registered PF_INET protocol family
[    0.680795][    T1] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.745932][    T1] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.756151][    T1] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.765554][    T1] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.775383][    T1] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.785674][    T1] TCP: Hash tables configured (established 32768 bind 32768)
[    0.794143][    T1] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes, linear)
[    0.803200][    T1] UDP hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.811638][    T1] UDP-Lite hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.820876][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.827931][    T1] NET: Registered PF_XDP protocol family
[    0.833981][    T1] PCI: CLS 0 bytes, default 64
[    0.839407][   T12] Trying to unpack rootfs image as initramfs...
[    0.968443][    T1] Initialise system trusted keyrings
[    0.974184][    T1] Key type blacklist registered
[    0.979660][    T1] workingset: timestamp_bits=44 max_order=20 bucket_order=0
[    0.989347][    T1] integrity: Platform Keyring initialized
[    0.995540][    T1] integrity: Machine keyring initialized
[    1.113004][    T1] Key type asymmetric registered
[    1.118315][    T1] Asymmetric key parser 'x509' registered
[    1.124594][    T1] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    1.133977][    T1] io scheduler mq-deadline registered
[    1.139754][    T1] io scheduler kyber registered
[    1.145130][    T1] io scheduler bfq registered
[    1.157883][    T1] riscv-plic: interrupt-controller@c000000: mapped 136 interrupts with 4 handlers for 9 contexts.
[    1.176089][    T1] ledtrig-cpu: registered to indicate activity on CPUs
[    1.184768][    T1] SBI CPPC extension NOT detected!!
[    1.197404][    T1] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.227373][    T1] Serial: AMBA driver
[    1.241519][    T1] mousedev: PS/2 mouse device common for all mice
[    1.250393][    T1] EDAC DEVICE0: Giving out device to module Sifive ECC Manager controller sifive_edac.0: DEV sifive_edac.0 (INTERRUPT)
[    1.264395][    T1] hid: raw HID events driver (C) Jiri Kosina
[    1.271266][    T1] riscv-pmu-sbi: SBI PMU extension is available
[    1.278035][    T1] riscv-pmu-sbi: 16 firmware and 4 hardware counters
[    1.285247][    T1] riscv-pmu-sbi: Perf sampling/filtering is not supported as sscof extension is not available
[    1.297931][    T1] NET: Registered PF_INET6 protocol family
[    2.725805][   T12] Freeing initrd memory: 27320K
[    2.800047][    T1] Segment Routing with IPv6
[    2.804898][    T1] RPL Segment Routing with IPv6
[    2.810161][    T1] In-situ OAM (IOAM) with IPv6
[    2.832512][    T1] registered taskstats version 1
[    2.839398][    T1] Loading compiled-in X.509 certificates
[    2.847924][    T1] Loaded X.509 cert 'Kernel OBS Project: 1fb41512acbc8eebdf828d877e4367bf6c719af3'
[    2.910855][    T1] Demotion targets for Node 0: null
[    2.917145][    T1] Key type .fscrypt registered
[    2.922267][    T1] Key type fscrypt-provisioning registered
[    2.928939][    T1] Key type big_key registered
[    3.064969][    T1] Key type encrypted registered
[    3.070472][    T1] ima: No TPM chip found, activating TPM-bypass!
[    3.077320][    T1] Loading compiled-in module X.509 certificates
[    3.085472][    T1] Loaded X.509 cert 'Kernel OBS Project: 1fb41512acbc8eebdf828d877e4367bf6c719af3'
[    3.095549][    T1] ima: Allocated hash algorithm: sha256
[    3.101562][    T1] ima: No architecture policies found
[    3.107472][    T1] evm: Initialising EVM extended attributes:
[    3.113909][    T1] evm: security.selinux
[    3.118334][    T1] evm: security.SMACK64 (disabled)
[    3.123815][    T1] evm: security.SMACK64EXEC (disabled)
[    3.129668][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[    3.136012][    T1] evm: security.SMACK64MMAP (disabled)
[    3.141889][    T1] evm: security.apparmor
[    3.146416][    T1] evm: security.ima
[    3.150463][    T1] evm: security.capability
[    3.155177][    T1] evm: HMAC attrs: 0x1
[    3.191010][    C0] CCACHE: DataError @ 0x00000000.08024BF0
[    3.197164][    C0] EDAC DEVICE0: CE: sifive_edac.0 instance: sifive_ecc0 block: sifive_ecc1 count: 1 'DatECCFix'
[    3.208484][    C0] CCACHE: DataFail @ 0x00000000.08024BFC
[    3.214529][    C0] EDAC DEVICE0: UE: sifive_edac.0 instance: sifive_ecc0 block: sifive_ecc1 count: 1 'DatECCFail'
[    3.257853][    T1] clk: Disabling unused clocks

Booting with openSBI 1.6 lets the boot to continue:

[    0.000000][    T0] Booting Linux on hartid 1
[    0.000000][    T0] Linux version 6.16.0-rc4-2.g79f1960-default (geeko@buildhost) (gcc (SUSE Linux) 15.1.1 20250626, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.43.1.20241209-8) #1 SMP PREEMPT_DYNAMIC Thu Jul  3 03:01:03 UTC 2025 (79f1960)
[    0.000000][    T0] Machine model: StarFive VisionFive 2 v1.2A
[    0.000000][    T0] SBI specification v2.0 detected
[    0.000000][    T0] SBI implementation ID=0x1 Version=0x10006
[    0.000000][    T0] SBI TIME extension detected
[    0.000000][    T0] SBI IPI extension detected
[    0.000000][    T0] SBI RFENCE extension detected
[    0.000000][    T0] SBI SRST extension detected
[    0.000000][    T0] SBI DBCN extension detected
[    0.000000][    T0] printk: debug: ignoring loglevel setting.
[    0.000000][    T0] efi: EFI v2.11 by Das U-Boot
[    0.000000][    T0] efi: RTPROP=0xfe6d2040 SMBIOS 3.0=0xff731000 INITRD=0xfe6b0040 RNG=0xfe6af040 MEMRESERVE=0xfe6ae040 
[    0.000000][    T0] random: crng init done
[    0.000000][    T0] OF: reserved mem: failed to allocate memory for node 'linux,cma': size 512 MiB
[    0.000000][    T0] cma: Reserved 16 MiB at 0x00000000fd600000
[    0.000000][    T0] earlycon: uart0 at MMIO32 0x0000000010000000 (options '115200n8')
[    0.000000][    T0] printk: legacy bootconsole [uart0] enabled
[    0.000000][    T0] OF: reserved mem: 0x0000000040040000..0x000000004005ffff (128 KiB) nomap non-reusable mmode_resv0@40040000
[    0.000000][    T0] OF: reserved mem: 0x0000000040000000..0x000000004003ffff (256 KiB) nomap non-reusable mmode_resv1@40000000
[    0.000000][    T0] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000][    T0] NODE_DATA(0) allocated [mem 0x13fdb30c0-0x13fdb587f]
[    0.000000][    T0] Zone ranges:
[    0.000000][    T0]   DMA32    [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000][    T0]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
[    0.000000][    T0]   Device   empty
[    0.000000][    T0] Movable zone start for each node
[    0.000000][    T0] Early memory node ranges
[    0.000000][    T0]   node   0: [mem 0x0000000040000000-0x000000004005ffff]
[    0.000000][    T0]   node   0: [mem 0x0000000040060000-0x00000000fe6d1fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6d2000-0x00000000fe6d2fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6d3000-0x00000000fe6d3fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6d4000-0x00000000fe6f5fff]
[    0.000000][    T0]   node   0: [mem 0x00000000fe6f6000-0x00000000ff730fff]
[    0.000000][    T0]   node   0: [mem 0x00000000ff731000-0x00000000ff731fff]
[    0.000000][    T0]   node   0: [mem 0x00000000ff732000-0x00000000fff2cfff]
[    0.000000][    T0]   node   0: [mem 0x00000000fff2d000-0x00000000fff2efff]
[    0.000000][    T0]   node   0: [mem 0x00000000fff2f000-0x000000013fffffff]
[    0.000000][    T0] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000][    T0] SBI HSM extension detected
[    0.000000][    T0] CPU with hartid=0 is not available
[    0.000000][    T0] riscv: base ISA extensions acdfim
[    0.000000][    T0] riscv: ELF capabilities acdfim
[    0.000000][    T0] Ticket spinlock: enabled
[    0.000000][    T0] percpu: Embedded 54 pages/cpu s95128 r8192 d117864 u221184
[    0.000000][    T0] pcpu-alloc: s95128 r8192 d117864 u221184 alloc=54*4096
[    0.000000][    T0] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000][    T0] Kernel command line: BOOT_IMAGE=/boot/Image-6.16.0-rc4-2.g79f1960-default root=UUID=6d8545d7-893d-46d3-ba3c-29a82457c120 ignore_loglevel earlycon mitigations=auto quiet security=selinux selinux=1 console=uart0,115200
[    0.000000][    T0] Unknown kernel command line parameters "BOOT_IMAGE=/boot/Image-6.16.0-rc4-2.g79f1960-default", will be passed to user space.
[    0.000000][    T0] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.000000][    T0] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000][    T0] software IO TLB: area num 4.
[    0.000000][    T0] software IO TLB: mapped [mem 0x00000000f9600000-0x00000000fd600000] (64MB)
[    0.000000][    T0] Fallback order for Node 0: 0 
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total pages: 1048576
[    0.000000][    T0] Policy zone: Normal
[    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000][    T0] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000][    T0] ftrace: allocating 44199 entries in 173 pages
[    0.000000][    T0] ftrace: allocated 173 pages with 5 groups
[    0.000000][    T0] Dynamic Preempt: voluntary
[    0.000000][    T0] rcu: Preemptible hierarchical RCU implementation.
[    0.000000][    T0] rcu:     RCU restricting CPUs from NR_CPUS=32 to nr_cpu_ids=4.
[    0.000000][    T0]  Trampoline variant of Tasks RCU enabled.
[    0.000000][    T0]  Rude variant of Tasks RCU enabled.
[    0.000000][    T0]  Tracing variant of Tasks RCU enabled.
[    0.000000][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000][    T0] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000][    T0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000][    T0] riscv-intc: 64 local interrupts mapped
[    0.000000][    T0] riscv: providing IPIs using SBI IPI extension
[    0.000000][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000][    T0] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 881590404240 ns
[    0.000001][    T0] sched_clock: 64 bits at 4MHz, resolution 250ns, wraps every 2199023255500ns
[    0.010208][    T0] Console: colour dummy device 80x25
[    0.016090][    T0] Calibrating delay loop (skipped), value calculated using timer frequency.. 8.00 BogoMIPS (lpj=16000)
[    0.028045][    T0] pid_max: default: 32768 minimum: 301
[    0.034190][    T0] LSM: initializing lsm=lockdown,capability,landlock,yama,selinux,bpf,ima,evm
[    0.044065][    T0] landlock: Up and running.
[    0.048859][    T0] Yama: becoming mindful.
[    0.053486][    T0] SELinux:  Initializing.
[    0.059766][    T0] LSM support for eBPF active
[    0.065219][    T0] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.074184][    T0] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.085461][    T1] CPU node for /cpus/cpu@0 exist but the possible cpu range is :0-3
[    0.095682][    T1] riscv: ELF compat mode unsupported
[    0.095708][    T1] ASID allocator disabled (0 bits)
[    0.106965][    T1] rcu: Hierarchical SRCU implementation.
[    0.113001][    T1] rcu:     Max phase no-delay instances is 1000.
[    0.119877][    T1] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.130470][    T1] Remapping and enabling EFI services.
[    0.136920][    T1] smp: Bringing up secondary CPUs ...
[    0.145842][    T1] smp: Brought up 1 node, 4 CPUs
[    0.164543][   T39] node 0 deferred pages initialised in 12ms
[    0.170952][    T1] Memory: 3925052K/4194304K available (12690K kernel code, 8597K rwdata, 12288K rodata, 8436K init, 912K bss, 247028K reserved, 16384K cma-reserved)
[    0.189318][    T1] devtmpfs: initialized
[    0.210225][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.221779][    T1] posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.230792][    T1] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
[    0.241914][    T1] pinctrl core: initialized pinctrl subsystem
[    0.249464][    T1] SMBIOS 3.7.0 present.
[    0.253900][    T1] DMI: starfive StarFive VisionFive 2 v1.2A/StarFive VisionFive 2 v1.2A, BIOS 2025.04 04/01/2025
[    0.265291][    T1] DMI: Memory slots populated: 0/0
[    0.274915][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.283358][    T1] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.292088][    T1] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.301671][    T1] audit: initializing netlink subsys (disabled)
[    0.308663][   T48] audit: type=2000 audit(0.164:1): state=initialized audit_enabled=0 res=1
[    0.309482][    T1] thermal_sys: Registered thermal governor 'fair_share'
[    0.317951][    T1] thermal_sys: Registered thermal governor 'bang_bang'
[    0.325413][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    0.332778][    T1] thermal_sys: Registered thermal governor 'user_space'
[    0.340210][    T1] cpuidle: using governor ladder
[    0.352979][    T1] cpuidle: using governor menu
[    0.382119][    C1] cpu1: Ratio of byte access time to unaligned word access is 0.01, unaligned accesses are slow
[    0.382120][    C2] cpu2: Ratio of byte access time to unaligned word access is 0.01, unaligned accesses are slow
[    0.382120][    C3] cpu3: Ratio of byte access time to unaligned word access is 0.01, unaligned accesses are slow
[    0.438231][   T10] cpu0: Ratio of byte access time to unaligned word access is 0.01, unaligned accesses are slow
[    0.449702][    T1] CCACHE: 8 banks, 16 ways, sets/bank=256, bytes/block=64
[    0.457361][    T1] CCACHE: Index of the largest way enabled: 15
[    0.464735][    T1] Serial: AMBA PL011 UART driver
[    0.476693][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /dsi_encoder
[    0.486240][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.496251][    T1] /soc/hdmi@29590000: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.518072][    T1] /dsi_encoder: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.527540][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /dsi_encoder
[    0.536997][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.547214][    T1] /soc/lcd-controller@29400000: Fixed dependency cycle(s) with /soc/hdmi@29590000
[    0.557257][    T1] /soc/hdmi@29590000: Fixed dependency cycle(s) with /soc/lcd-controller@29400000
[    0.568609][    T1] /soc/pcie@940000000: Fixed dependency cycle(s) with /soc/pcie@940000000/interrupt-controller
[    0.580396][    T1] /soc/pcie@9c0000000: Fixed dependency cycle(s) with /soc/pcie@9c0000000/interrupt-controller
[    0.595382][    T1] HugeTLB: allocation took 0ms with hugepage_allocation_threads=1
[    0.603827][    T1] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.612051][    T1] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.620085][    T1] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.628306][    T1] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.639707][    T1] ACPI: Interpreter disabled.
[    0.644991][    T1] iommu: Default domain type: Passthrough
[    0.652139][    T1] EDAC MC: Ver: 3.0.0
[    0.656818][    T1] efivars: Registered efivars operations
[    0.664583][    T1] NetLabel: Initializing
[    0.669097][    T1] NetLabel:  domain hash size = 128
[    0.674648][    T1] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.681777][    T1] NetLabel:  unlabeled traffic allowed by default
[    0.688689][    T1] mctp: management component transport protocol core
[    0.695863][    T1] NET: Registered PF_MCTP protocol family
[    0.702676][    T1] vgaarb: loaded
[    0.706882][    T1] clocksource: Switched to clocksource riscv_clocksource
[    0.718623][    T1] VFS: Disk quotas dquot_6.6.0
[    0.723810][    T1] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.732586][    T1] pnp: PnP ACPI: disabled
[    0.750781][    T1] NET: Registered PF_INET protocol family
[    0.757486][    T1] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.824585][    T1] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.834809][    T1] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.844227][    T1] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.854083][    T1] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.864334][    T1] TCP: Hash tables configured (established 32768 bind 32768)
[    0.873109][    T1] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes, linear)
[    0.882245][    T1] UDP hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.890710][    T1] UDP-Lite hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.900030][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.907108][    T1] NET: Registered PF_XDP protocol family
[    0.913158][    T1] PCI: CLS 0 bytes, default 64
[    0.918566][   T12] Trying to unpack rootfs image as initramfs...
[    1.048402][    T1] Initialise system trusted keyrings
[    1.054236][    T1] Key type blacklist registered
[    1.059936][    T1] workingset: timestamp_bits=44 max_order=20 bucket_order=0
[    1.069946][    T1] integrity: Platform Keyring initialized
[    1.076144][    T1] integrity: Machine keyring initialized
[    1.193615][    T1] Key type asymmetric registered
[    1.198941][    T1] Asymmetric key parser 'x509' registered
[    1.205249][    T1] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    1.214604][    T1] io scheduler mq-deadline registered
[    1.220382][    T1] io scheduler kyber registered
[    1.225761][    T1] io scheduler bfq registered
[    1.243891][    T1] riscv-plic: interrupt-controller@c000000: mapped 136 interrupts with 4 handlers for 9 contexts.
[    1.262097][    T1] ledtrig-cpu: registered to indicate activity on CPUs
[    1.271019][    T1] SBI CPPC extension NOT detected!!
[    1.283959][    T1] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.314454][    T1] Serial: AMBA driver
[    1.323235][    T1] mousedev: PS/2 mouse device common for all mice
[    1.332170][    T1] EDAC DEVICE0: Giving out device to module Sifive ECC Manager controller sifive_edac.0: DEV sifive_edac.0 (INTERRUPT)
[    1.346174][    T1] hid: raw HID events driver (C) Jiri Kosina
[    1.353044][    T1] riscv-pmu-sbi: SBI PMU extension is available
[    1.359822][    T1] riscv-pmu-sbi: 16 firmware and 4 hardware counters
[    1.367026][    T1] riscv-pmu-sbi: Perf sampling/filtering is not supported as sscof extension is not available
[    1.382193][    T1] NET: Registered PF_INET6 protocol family
[    2.798320][   T12] Freeing initrd memory: 27320K
[    2.871132][    T1] Segment Routing with IPv6
[    2.875966][    T1] RPL Segment Routing with IPv6
[    2.881231][    T1] In-situ OAM (IOAM) with IPv6
[    2.903699][    T1] registered taskstats version 1
[    2.910602][    T1] Loading compiled-in X.509 certificates
[    2.918576][    T1] Loaded X.509 cert 'Kernel OBS Project: 1fb41512acbc8eebdf828d877e4367bf6c719af3'
[    2.982083][    T1] Demotion targets for Node 0: null
[    2.988376][    T1] Key type .fscrypt registered
[    2.993488][    T1] Key type fscrypt-provisioning registered
[    3.000197][    T1] Key type big_key registered
[    3.134499][    T1] Key type encrypted registered
[    3.139983][    T1] ima: No TPM chip found, activating TPM-bypass!
[    3.146825][    T1] Loading compiled-in module X.509 certificates
[    3.154985][    T1] Loaded X.509 cert 'Kernel OBS Project: 1fb41512acbc8eebdf828d877e4367bf6c719af3'
[    3.165057][    T1] ima: Allocated hash algorithm: sha256
[    3.171138][    T1] ima: No architecture policies found
[    3.177018][    T1] evm: Initialising EVM extended attributes:
[    3.183457][    T1] evm: security.selinux
[    3.187878][    T1] evm: security.SMACK64 (disabled)
[    3.193355][    T1] evm: security.SMACK64EXEC (disabled)
[    3.199209][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[    3.205537][    T1] evm: security.SMACK64MMAP (disabled)
[    3.211391][    T1] evm: security.apparmor
[    3.215909][    T1] evm: security.ima
[    3.219951][    T1] evm: security.capability
[    3.224661][    T1] evm: HMAC attrs: 0x1
[    3.326319][    T1] clk: Disabling unused clocks
[   11.023381][   T12] 10000000.serial: ttyS0 at MMIO 0x10000000 (irq = 24, base_baud = 1500000) is a 16550A
[   11.039496][   T12] ssp-pl022 10060000.spi: ARM PL022 driver, device ID: 0x00041022
[   11.053438][   T12] ssp-pl022 10060000.spi: mapped registers from 0x0000000010060000 to 00000000fe7d86f3
[   11.071093][   T12] pcie-starfive 940000000.pcie: host bridge /soc/pcie@940000000 ranges:
[   11.075851][  T256] axp20x-i2c 5-0036: AXP20x variant AXP15060 found
[   11.080188][   T12] pcie-starfive 940000000.pcie:      MEM 0x0030000000..0x0037ffffff -> 0x0030000000

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
